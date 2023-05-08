<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.List" %>

<%@ page import="java.util.Objects" %>
<%@ page import="com.example.backofficewbdesign.model.Categorie" %>
<%@ page import="com.example.backofficewbdesign.model.Article" %><%--
  Created by IntelliJ IDEA.
  User: LoicRaveloarimanana
  Date: 07/05/2023
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<Categorie> categories = (List<Categorie>) request.getAttribute("categories");
  Article ar = (Article) request.getAttribute("data");
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>IA contents &mdash; modification article</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="modification article">

  <link href="https://fonts.googleapis.com/css?family=B612+Mono|Cabin:400,700&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="<c:url value="/resources/theme/fonts/icomoon/style.css" />"  type="text/css">

  <link rel="stylesheet" href="<c:url value="/resources/theme/css/bootstrap.min.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/jquery-ui.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/owl.carousel.min.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/owl.theme.default.min.css"/>" type="text/css">
  <link rel="stylesheet" href="<c:url value="/resources/theme/css/jquery.fancybox.min.css"/>" type="text/css">


  <link rel="stylesheet" href="<c:url value="/resources/theme/css/style.css"/>">



</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<div class="site-wrap">





  <div class="header-top">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-12 col-lg-6 d-flex">
          <p href="index.html" class="site-logo">
            IA_actus
          </p>
        </div>
      </div>
    </div>
    <div class="site-navbar py-2 js-sticky-header site-navbar-target d-none pl-0 d-lg-block" role="banner">

      <div class="container">
        <div class="d-flex align-items-center">

          <div class="mr-auto">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mr-auto d-none pl-0 d-lg-block">
                <li class="active">
                  <a href="#" class="nav-link text-left">ajoutarticle</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/allArticles?num=1" class="nav-link text-left">mesArticles</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/retiredArticle?num=1" class="nav-link text-left">retirer</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/singOut" class="nav-link text-left">deconnexion</a>
                </li>
              </ul>
            </nav>

          </div>

        </div>
      </div>

    </div>
  </div>



    <div class="site-section bg-light">
    <div class="container">
      <div class="row">

        <div class="col-lg-12">
          <div class="section-title mb-5">
            <h2>modification article</h2>
          </div>
          <div class="section-title mb-5">
            <img src="<%=ar.getPhoto()%>" width="200" height="200" alt="<%=ar.getTitre()%>">
          </div>
          <form method="post" action="<%=request.getContextPath()%>/update" enctype="multipart/form-data">

            <div class="row">
              <input type="hidden" value="<%=ar.getAdmin().getId()%>" name="idAdmin">
              <input type="hidden" value="<%=ar.getId()%>" name="idArticle">
              <input type="hidden" value="<%=ar.getPhoto()%>" name="photo">
              <div class="col-md-6 form-group">
                <label for="fname">titre</label>
                <input type="text" id="fname" class="form-control form-control-lg" name="titre" value="<%=ar.getTitre()%>" required>
              </div>
              <div class="col-md-6 form-group">
                <label for="lname">categorie</label>
                <select  id="lname" class="form-control form-control-lg" name="idC">
                  <option value="<%=ar.getCategorie().getId()%>"><%=ar.getCategorie().getNomCategorie()%></option>
                  <% for(Categorie categorie : categories) { %>
                      <% if (!Objects.equals(categorie.getId(), ar.getCategorie().getId())) { %>
                        <option value="<%=categorie.getId()%>"><%=categorie.getNomCategorie()%></option>
                      <% }%>
                  <%}%>
                </select>

              </div>
            </div>

            <style>
              #containerEditor {
                width: 1000px;
                margin: 20px auto;
              }
              .ck-editor__editable[role="textbox"] {
                /* editing area */
                min-height: 200px;
              }
              .ck-content .image {
                /* block images */
                max-width: 80%;
                margin: 20px auto;
              }
            </style>
            <div class="row">
              <div class="col-md-12 form-group">

                <div id="containerEditor">

                  <label for="editor">edition</label>
                  <textarea id="editor" name="descri" defaultValue="<%=ar.getDescri()%>" required>
                  </textarea>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 form-group">
                <label for="fileupload">import photo</label>
                <input type="file" id="fileupload"  class="form-control form-control-lg" name="pathPhoto" >
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                <input type="submit" value="ajouter" class="btn btn-primary py-3 px-5">
              </div>
            </div>

          </form>
        </div>

      </div>


    </div>
  </div>



  <div class="footer">
    <div class="container">


      <div class="row">
        <div class="col-12">
          <div class="copyright">
            <p>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>


</div>

<!-- .site-wrap -->


<!-- loader -->
<div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#ff5e15"/></svg></div>


<script src="<c:url value="/resources/theme/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery-migrate-3.0.1.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery-ui.js"/>"></script>
<script src="<c:url value="/resources/theme/js/popper.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/owl.carousel.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery.stellar.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/jquery.countdown.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/bootstrap-datepicker.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/jquery.easing.1.3.js"/>"></script>
<script src="<c:url value="/resources/theme/js/aos.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery.fancybox.min.js" />"></script>
<script src="<c:url value="/resources/theme/js/jquery.sticky.js"/>"></script>
<script src="<c:url value="/resources/theme/js/jquery.mb.YTPlayer.min.js"/>"></script>
<script src="<c:url value="/resources/theme/js/main.js"/>"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.1.0/super-build/ckeditor.js"></script>

<script>
  const textarea = document.getElementById("editor");
  textarea.value = '<%=ar.getDescri()%>';
  // This sample still does not showcase all CKEditor 5 features (!)
  // Visit https://ckeditor.com/docs/ckeditor5/latest/features/index.html to browse all the features.
   CKEDITOR.ClassicEditor.create(document.querySelector('#editor'), {

    // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
    toolbar: {
      items: [
        'exportPDF','exportWord', '|',
        'findAndReplace', 'selectAll', '|',
        'heading', '|',
        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
        'bulletedList', 'numberedList', 'todoList', '|',
        'outdent', 'indent', '|',
        'undo', 'redo',
        '-',
        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
        'alignment', '|',
        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
        'textPartLanguage', '|',
        'sourceEditing'
      ],
      shouldNotGroupWhenFull: true
    },
    // Changing the language of the interface requires loading the language file using the <script> tag.
    // language: 'es',
    list: {
      properties: {
        styles: true,
        startIndex: true,
        reversed: true
      }
    },
    // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
    heading: {
      options: [
        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
        { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
        { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
        { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
      ]
    },

    // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
    placeholder: 'Welcome to CKEditor 5!',
    value:'<p>hello</p>',
    // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
    fontFamily: {
      options: [
        'default',
        'Arial, Helvetica, sans-serif',
        'Courier New, Courier, monospace',
        'Georgia, serif',
        'Lucida Sans Unicode, Lucida Grande, sans-serif',
        'Tahoma, Geneva, sans-serif',
        'Times New Roman, Times, serif',
        'Trebuchet MS, Helvetica, sans-serif',
        'Verdana, Geneva, sans-serif'
      ],
      supportAllValues: true
    },
    // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
    fontSize: {
      options: [ 10, 12, 14, 'default', 18, 20, 22 ],
      supportAllValues: true
    },
    // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
    // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
    htmlSupport: {
      allow: [
        {
          name: /.*/,
          attributes: true,
          classes: true,
          styles: true
        }
      ]
    },
    // Be careful with enabling previews
    // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
    htmlEmbed: {
      showPreviews: true
    },
    // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
    link: {
      decorators: {
        addTargetToExternalLinks: true,
        defaultProtocol: 'https://',
        toggleDownloadable: {
          mode: 'manual',
          label: 'Downloadable',
          attributes: {
            download: 'file'
          }
        }
      }
    },
    // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
    mention: {
      feeds: [
        {
          marker: '@',
          feed: [
            '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
            '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
            '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
            '@sugar', '@sweet', '@topping', '@wafer'
          ],
          minimumCharacters: 1
        }
      ]
    },
    // The "super-build" contains more premium features that require additional configuration, disable them below.
    // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
    removePlugins: [
      // These two are commercial, but you can try them out without registering to a trial.
      // 'ExportPdf',
      // 'ExportWord',
      'CKBox',
      'CKFinder',
      'EasyImage',
      // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
      // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
      // Storing images as Base64 is usually a very bad idea.
      // Replace it on production website with other solutions:
      // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
      // 'Base64UploadAdapter',
      'RealTimeCollaborativeComments',
      'RealTimeCollaborativeTrackChanges',
      'RealTimeCollaborativeRevisionHistory',
      'PresenceList',
      'Comments',
      'TrackChanges',
      'TrackChangesData',
      'RevisionHistory',
      'Pagination',
      'WProofreader',
      // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
      // from a local file system (file://) - load this site via HTTP server if you enable MathType.
      'MathType',
      // The following features are part of the Productivity Pack and require additional license.
      'SlashCommand',
      'Template',
      'DocumentOutline',
      'FormatPainter',
      'TableOfContents'
    ]
  });



</script>>
</body>

</html>

