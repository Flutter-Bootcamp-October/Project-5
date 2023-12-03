class ConsentNetworking {
  // url api
  final String urlApi = "bacend-fshi.onrender.com";
  //auth endpoint
  final String registration = '/auth/registration';
  final String login = '/auth/login';
  final String verification = '/auth/verification';
//upload image endpoint
  final String upload = '/user/upload';
//About endpoint
  final String getAbout = '/user/about';
  final String editAbout = '/user/edit/about';
  final String deleteAbout = '/user/delete_account';
  //Projects endpoint
  final String getProjects = '/user/projects';
  final String addProject = '/user/add/project';
  final String deleteProject = '/user/delete/project';
  //Skills endpoint
  final String getSkills = '/user/skills';
  final String addSkills = '/user/add/skills';
  final String deleteSkills = '/user/delete/skills';
  //SocialMedia  endpoint
  final String getSocialMedia = '/user/social_media';
  final String addSocialMedia = '/user/add/social_media';
  final String deleteSocialMedia = '/user/delete/social_media';
  //Education endpoint
  final String getEducation = '/user/education';
  final String addEducation = '/user/add/education';
  final String deleteEducation = '/user/delete/education';
  //Projects endpoint
  final String getAllUsers = '/user/get_users';
}
