package dev.sandilabs.hilo.user;

public record UserDto(Long id, String username, String displayName, String bio) {

    public static UserDto from(User user) {
        return new UserDto(user.getId(), user.getUsername(), user.getDisplayName(), user.getBio());
    }
}
