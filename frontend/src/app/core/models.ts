// Contratos con la API (backend/). Si cambias un DTO en Java, cámbialo también aquí.

export interface User {
  id: number;
  username: string;
  displayName: string;
  bio: string | null;
}

export interface Post {
  id: number;
  author: User;
  content: string;
  likeCount: number;
  likedByMe: boolean;
  createdAt: string; // ISO-8601, en UTC
}

export interface Page<T> {
  items: T[];
  page: number;
  size: number;
  totalItems: number;
  hasNext: boolean;
}
