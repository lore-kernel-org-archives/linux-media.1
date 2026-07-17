Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3442385D9B;
	Fri, 17 Jul 2026 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293120; cv=pass; b=gwdCVLaCwC7GXblp+vvGNz+wgd8u7kWDK+GtQepgJ2UNsWT9rjQlkNH2vtAOSHRihLgqmjPar/V15FRxVefWEww1UmlpEHdovrWJRPL7VOtD+mPQuqMsnoBlNzTYYsjMAdIUPxvqhGjWcDthwnSH1ythZm/OWz5kbSLVepx8CKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293120; c=relaxed/simple;
	bh=Gv+z2BgfldxDyUREVB3+9hcv3cmAGqxRcnCQK8U1Jx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MBc6f5zyt07omvHeXXKFWPFMi3rBmSpggxAEkrpphxmL8XQ8bp9kqVfCKaExKPjahOdDfEi/iHxknHvxJkQPPhaxafW5GLxEE8IpWKKPZgbDn+n/sPdJBspAyMnr26zoUJEiZsWPlJoeg+hXyk2zcAkG0iDY/IezfBSxhhcnrys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=robert.mader@collabora.com header.b=gdZz9/Ia; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=robert.mader@collabora.com header.b="gdZz9/Ia"
ARC-Seal: i=1; a=rsa-sha256; t=1784293103; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ds456rzKFf7Ol5VfceYJrkWmF73bztGqivZaJM9IO3njn+P2+b1s+tcFDYZ0OlsI8/JE32i6mqFyFWCuGYtBkWpBMxr3Q+xGMaeq98/xShh6++pp9O6JyZtcQht3iA24y+UpK/ZQCqD9uPnd63WsD9jzEaKtgaOLw1o6z9m4t2s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784293103; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S/jjUgRD8Eu8vzfM978cwC4OdnQY9exzRMPXWsHtOdY=; 
	b=mSh5edZbwZIXpoSdv9L+h1vCCUgxqxlbLh7AFVjV96GHTAZnbmwKP3Yc7nMqC4QdbYUJQhl71/s/BQyTvonqoEaMaTI6AxDTPDQgMwIT/MRe9uBNEMXmRrEd7fo4P6VH9nHHRh5CPH2UbM1n/r7M06Yol65wfoTryAIbw0yHry8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=robert.mader@collabora.com;
	dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784293103;
	s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=S/jjUgRD8Eu8vzfM978cwC4OdnQY9exzRMPXWsHtOdY=;
	b=gdZz9/IayZZECusXulKedWk+KVsIZ4C3mvXNAeHDpnMu+srtx3UenWI9Vs4OwYQv
	yoGzur6/ak86wwoIr2w+y1f7VMQ6KmveXUAJOQjWljRrt7Wzo8MQpLYw+NcwWa8VMnF
	pCNugVpot1zcXPpAnG6a1m0Xf7kO/52MBhfkKXUM=
Received: by mx.zohomail.com with SMTPS id 1784293102067219.6950633684885;
	Fri, 17 Jul 2026 05:58:22 -0700 (PDT)
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
Subject: [PATCH v1] dma-buf/udmabuf: Disable the size limit by default
Date: Fri, 17 Jul 2026 14:57:49 +0200
Message-ID: <20260717125750.62639-1-robert.mader@collabora.com>
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

Therefor let's disable the size limit by default. Use the special value
of zero to do so, which prevously could be used to effectively disable the
interface. Using other means, such as file permissions, appears to be a
much better fit for that purpose.

Signed-off-by: Robert Mader <robert.mader@collabora.com>

---

Please let me know if changing the meaning of the parameter value of zero
is considered a breaking change / not acceptable. In that case INT_MAX
might be a better option.

See
https://lore.kernel.org/dri-devel/20260711144814.8205-1-robert.mader@collabora.com/
for a previous attempt to make the value configurable via kconfig - and
in particular
https://lore.kernel.org/dri-devel/6764ca6f-b4d8-4baa-9d27-2ca867ac2d41@amd.com/
for the suggestion and discussion to remove the default limit.
---
 drivers/dma-buf/udmabuf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index bced421c0d65..3509b690d8e2 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -20,9 +20,9 @@ static int list_limit = 1024;
 module_param(list_limit, int, 0644);
 MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 1024.");
 
-static int size_limit_mb = 64;
+static int size_limit_mb = 0;
 module_param(size_limit_mb, int, 0644);
-MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
+MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Setting 0 disables the limit. Default is 0.");
 
 struct udmabuf {
 	pgoff_t pagecount;
@@ -373,7 +373,7 @@ static long udmabuf_create(struct miscdevice *device,
 
 		subpgcnt = list[i].size >> PAGE_SHIFT;
 		pgcnt += subpgcnt;
-		if (pgcnt > pglimit)
+		if (pglimit && pglimit < pgcnt)
 			goto err_noinit;
 
 		max_nr_folios = max_t(unsigned long, subpgcnt, max_nr_folios);
-- 
2.55.0

