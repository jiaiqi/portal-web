export const useApi = () => {
  const config = useRuntimeConfig()

  const request = async <T>(url: string, options?: RequestInit): Promise<T> => {
    const response = await fetch(`${config.public.apiBase || 'http://localhost:8080'}${url}`, {
      ...options,
      headers: {
        'Content-Type': 'application/json',
        ...options?.headers,
      },
    })

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`)
    }

    return response.json() as Promise<T>
  }

  return {
    get: <T>(url: string) => request<T>(url, { method: 'GET' }),
    post: <T>(url: string, body?: any) => request<T>(url, { method: 'POST', body: JSON.stringify(body) }),
    put: <T>(url: string, body?: any) => request<T>(url, { method: 'PUT', body: JSON.stringify(body) }),
    delete: <T>(url: string) => request<T>(url, { method: 'DELETE' }),
  }
}
