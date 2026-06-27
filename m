Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADEB3955CC;
	Sat, 27 Jun 2026 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782557897; cv=pass; b=tCUwFaldrRomjQ8nWeb+ZDphbxzu5LBgt3rZoKN76GdcTE5djxbOJermplGW1/jcFGZaif4QdheVGHSBOWSa+Nxan7WfdrINgtW4oi+AY0wdlE0HslPLEwV0a8Z+Yq7BMY2w4IvLTJ3ajDBJvoABpqxQlAFWcPASaZcuY5tACkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782557897; c=relaxed/simple;
	bh=PnaZSeJ/fJmMzFSY6kGEVXE/lKFbg9YM0ZSITZYEbbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AdFgXFs2HVOPBTiEDCHwIPiRU7SpKa2M95OXZphex+BUhE5eKgcY1KmqtBl/+rlDQwk1NeDiK7yAw9MuvGdsAsMHHquX0mM/rmh5ndMdLz6qodDvXkYfNy+ja930kF8jkpdnqYPHIj4b+6oextPJ18FvPy5oQOULiWxbbRdTSlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=robert.mader@collabora.com header.b=cU8OprZX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=robert.mader@collabora.com header.b="cU8OprZX"
ARC-Seal: i=1; a=rsa-sha256; t=1782557891; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TPAszodKOjsHUQXUH/Gxt1QipDH1lvWmdbKozRWi5dy/teU0upLxEInQumEdQfhSBqJLAwvsaobWNQH0URNI3lAtBCHYGiWMp1pblJvk+fyJDFY7q5jiu7GBz2QCEtc+dT574te1z/bfRcgKNOzc1VElb2Clp0fEHVn3j3uDE8w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782557891; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r+ECMRwUoj1qfDDF4fDzCAVRuUEA0RstFvYJct8WxzA=; 
	b=PK1/UPu/M6RTUAKbVCj83VqjDbOGQjkuuLElGFakYK+i/706TJsoQ+rEiYsmzEZI4gT8PhO6TURfczO1MEY/52+GEx2mQW2yQ0fNogx20T1z+/Eg4i/U+Ep8rWpHrXbcxIhhrWn/Q0DTyGzud2s0JuCTq+56SAk7qfGnUu1MCUo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=robert.mader@collabora.com;
	dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782557891;
	s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=r+ECMRwUoj1qfDDF4fDzCAVRuUEA0RstFvYJct8WxzA=;
	b=cU8OprZXYkA4b725w/61H0jdD87dKL0542c6VnfpjBYdZZCU7nWp0zqYGjTyMX+5
	3UxVYdaADSPAmtwTUN+AMUMQuYJujapf+SPjmBoQtv/jbBWFIa7U1t+QhD9jmE8qXfR
	glrUulBRE0jqahNIBQEKiZYYjjQ8ZjggRSFM6dE0=
Received: by mx.zohomail.com with SMTPS id 1782557889082692.4068701852244;
	Sat, 27 Jun 2026 03:58:09 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: mikhail.v.gavrilov@gmail.com,
	vivek.kasireddy@intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>
Subject: [PATCH v1] udmabuf: Ensure to perform cache synchronisation in begin_cpu_udmabuf()
Date: Sat, 27 Jun 2026 12:57:25 +0200
Message-ID: <20260627105725.9083-1-robert.mader@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The message of commit 504e2b4ab97a ("dma-buf/udmabuf: skip redundant cpu sync to
fix cacheline EEXIST warning") says:

> The CPU sync at map/unmap time is also redundant for udmabuf:
> begin_cpu_udmabuf() and end_cpu_udmabuf() already perform explicit
> cache synchronization via dma_sync_sgtable_for_cpu/device() when CPU
> access is requested through the dma-buf interface.

This, however, does not apply to the first time begin_cpu_udmabuf() is
called on an udmabuf, in which case the implementation previously relied on
get_sg_table() to perform the cache synchronisation.

Ensure to call dma_sync_sgtable_for_cpu() in that case as well.

Fixes: 504e2b4ab97a ("dma-buf/udmabuf: skip redundant cpu sync to fix cacheline EEXIST warning")
Signed-off-by: Robert Mader <robert.mader@collabora.com>
---
 drivers/dma-buf/udmabuf.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index bced421c0d65..08f57bc1294d 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -224,21 +224,22 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
 {
 	struct udmabuf *ubuf = buf->priv;
 	struct device *dev = ubuf->device->this_device;
-	int ret = 0;
 
 	if (!ubuf->sg) {
 		ubuf->sg = get_sg_table(dev, buf, direction);
 		if (IS_ERR(ubuf->sg)) {
+			int ret;
+
 			ret = PTR_ERR(ubuf->sg);
 			ubuf->sg = NULL;
+			return ret;
 		} else {
 			ubuf->sg_dir = direction;
 		}
-	} else {
-		dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
 	}
 
-	return ret;
+	dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
+	return 0;
 }
 
 static int end_cpu_udmabuf(struct dma_buf *buf,
-- 
2.54.0

