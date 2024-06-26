// models/User.js

const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

const User = {
  async create({ user_name, password, email }) {
    try {
      const newUser = await prisma.user.create({
        data: {
          user_name,
          password,
          email,
        },
      });
      return newUser;
    } catch (error) {
      console.error('Ошибка при создании пользователя:', error);
      throw error;
    }
  },

  async findByUserName(user_name) {
    try {
      const user = await prisma.user.findUnique({
        where: {
          user_name,
        },
      });
      return user;
    } catch (error) {
      console.error('Ошибка при поиске пользователя по имени:', error);
      throw error;
    }
  },

  // Добавьте другие методы по мере необходимости (обновление, удаление и т. д.)
};

module.exports = User;

