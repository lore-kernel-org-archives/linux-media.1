Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9314A13B9;
	Wed, 22 Jul 2026 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718161; cv=pass; b=oBp+cAKl0JvnoX8AIftvPpDSEsvC4w+83wFiwx4N6ZY7nK2fF7DIRLpI1+nHQQ2fYQ3eMgqIzKx8SjqUhU5O4CcsvG3NFl1kfXLO/Xvc30OmynWl1niMtvbW7pRYvNOHTd0o2pm6TaXWxtoTlKtdoiPWnCnpFce/CVz0IEp66R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718161; c=relaxed/simple;
	bh=5VEO61H4eoOG/qr4PKF1B55DZAsFGLz4zfpFxyPw1FI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sEyrgBpa4kZkA6/BmWEeI+yjawihiOKvIG/mTSA8EMMQnUxoCrd9umbDUcxOZjYzDHaFVbMwu/8vmEL8y4KZPXOi/27gQ0Faxg/vkFdeDhcgG0KXA24bKmLTkdOi7BqYbtWHaAvNrvxfys03jUyqjBWyr8EnYCwG67d8AjkJ16k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=robert.mader@collabora.com header.b=c7eJHv/b; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=robert.mader@collabora.com header.b="c7eJHv/b"
ARC-Seal: i=1; a=rsa-sha256; t=1784718141; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FTIzYTAHnNmqg3YqHfP0hRY6WyltBO43A2zQcoksCICAljD8pkR/d39o4ABWODjpsR6Bap8E4WbvNlu4XUOGK2N5OeHrliPej+YjQM9xP1abBn/JuQXRh10v0SbVgXpUl/QckkuoW6kbifJE3kIQ4gxh5nWhAOS9u8YPNvOMj7M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784718141; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WSLpe5B4oyutsM1XL0vI0oMyM7hDOuX8x5AFgnGgADQ=; 
	b=g4oLwvNAbeeLhZGyOb9s7maRHSEMPptt81l7sgSmJ7mNFRKCYDTwU0sxM1SZjDkLYNgrllA0IK6yRHPRf23tib2W6s80hFLlmrrVXcrOWoXQK1+1hDhXk+HXEXHHKCMXMfZZy0pk4ZxLD1wksjA8+kboQdcPRsFlfBFjt6uG+9Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=robert.mader@collabora.com;
	dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784718141;
	s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WSLpe5B4oyutsM1XL0vI0oMyM7hDOuX8x5AFgnGgADQ=;
	b=c7eJHv/bFoqiK62YpQ5vhqKvsWM6RnZxxulXEfDVXoQrJbc2V3qRFPJ+zNlxohFn
	XBqhzgGL4PRJwoaFRz5caib/DtUjKZoA2XjfCGv0bVQ8L19oAH7t7W8EorVdbQHv4Ef
	S4WaHffQ3cnlmRJEypFu1vkghQ4V6CyvpjC6YNKU=
Received: by mx.zohomail.com with SMTPS id 1784718140462259.5530375342954;
	Wed, 22 Jul 2026 04:02:20 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dma-buf/udmabuf: Disable the size limit by default
Date: Wed, 22 Jul 2026 13:01:45 +0200
Message-ID: <20260722110145.36641-1-robert.mader@collabora.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As udmabuf increasingly enjoys popularity - being used in projects like
libcamera, Gstreamer, Mesa, KWin and Weston - users more frequently
encounter cases where the current default size limit of 64MB is too low.
Examples include allocating video buffers at a 8K resolution - and even 4K
is affected when using non-subsampled video formats and high bit depths.

In its current form the size limit for individual buffers does not seem to
provide any additional level of protection - such as limiting the amount of
memory a process can pin - as the later can just allocate multiple buffers.
If additional guardrails are desired, they would likely require some kind
accounting not limited to individual buffers.

Therefor let's disable the size limit by default by setting it to the
maximal possible value, INT_MAX.

Signed-off-by: Robert Mader <robert.mader@collabora.com>

---

Changes in V2:
 - Use INT_MAX instead of 0 in order to not change behavior otherwise.

See
https://lore.kernel.org/dri-devel/20260711144814.8205-1-robert.mader@collabora.com/
for a previous attempt to make the value configurable via kconfig - and
in particular
https://lore.kernel.org/dri-devel/6764ca6f-b4d8-4baa-9d27-2ca867ac2d41@amd.com/
for the suggestion and discussion to remove the default limit.
---
 drivers/dma-buf/udmabuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index bced421c0d65..639e93704924 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -20,9 +20,9 @@ static int list_limit = 1024;
 module_param(list_limit, int, 0644);
 MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 1024.");
 
-static int size_limit_mb = 64;
+static int size_limit_mb = INT_MAX;
 module_param(size_limit_mb, int, 0644);
-MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
+MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is INT_MAX.");
 
 struct udmabuf {
 	pgoff_t pagecount;
-- 
2.55.0

