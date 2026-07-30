Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F707231A3B
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 00:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785371520; cv=none; b=MFJX9EMsutmEFi6/lgBiNA+jriZJC8WHL+C3tWrN00EFw7jRk/nhtVgFrRH8d9NSezbYQ6tgGLK64cgj93fBtiuvjnXvrJkZgIvKGhjGzL5taW0y+XynCFvlqTCaJ/dbLfvuBooc9O28B5EXz9ymXJN/cPPd7B8NHivjE0lyXTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785371520; c=relaxed/simple;
	bh=bO6bqb6KUrCPgryacquWh0ulqfVmsf3tpawDe42V13E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hPewJwOdz0EN14m0OyKthioiEDOdA5LKWMVbVvHg53KldqMVvQfnBKa8ueWo36v7U69QjTeFlis3Ce4SekDlrloTvwNCuwJKvIYVtEOgSgBsyZvwaCnDckGpHh8Ayy+j/EWbttT3bMPTiNApVgCb+aPNgYkdezgg49UuKDM0aMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfD1ORkl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfD1ORkl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceab75934dso19009995ad.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 17:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785371518; x=1785976318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fI6aSyOYXjF/tGTQD0BJTcmduvJ9bMsRenmuTJgMGVU=;
        b=AfD1ORklujtuKaH3cyNLvDs0arByPKK2lmFYa8Xx+OCP7BKd0uY5hooWs9ndXJ5iX5
         31yxYRtb0yJKJMMxUgc1nhrJOXSUppiOHz5MVJip/NtEHgjY3Jvvkp6u+G4E3N9TRe9Y
         MDP7bqli2pJfjNROVN4PBo/uF8M1EQL8+N73hN7arh3bZFe9JHchYlgN3U1JWwQpKwnQ
         puqvT15bLPiPB3DDpHUZOaXFt0nRlSbXd0IRFfezo8ktdyP+ErKUJ5gv/YiH8YMsixfY
         cu5hxWIm7Ysy7n5p+XYY2aZfJDEHmtw5k8JoposYmbc8L9qvd9BqjYo629yGY8JKSGps
         qxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785371518; x=1785976318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fI6aSyOYXjF/tGTQD0BJTcmduvJ9bMsRenmuTJgMGVU=;
        b=QS5j88HC8X9zIJXbYJ1YP394SUPVPbozc4GM/K+sdBs4Fh6f8aAwLUh7/+0xrn7goE
         EOq6eP1tXD5T15FlUESAtZuoIOE8Wxhss7Z6F2CPdWKzH5F5SAjuZakn0VtV/hvETxaU
         Wr+qfmEoMuva9BmM+gS7/y5jLTm3UTnOvo2jRdx7ymZ8zXq9KewHgms6zEB4vox3Uy/E
         fvENIfmjuDsMajND1hJIUcTlVL2zmiyucsf2eGcXkPmBJNbuvwNF9jqybpx/dr/lbWvL
         3Pb2+d5Q7HEiaFCOMkKPS5rdJzHr64hBfNMhPGWygiAqFOgnhAR83rQ64fUa09K0mCA5
         jjxg==
X-Gm-Message-State: AOJu0YwicPCXKs1aOWWJmO3oQnsxdV+ZjashJILMz3ycCS/iWT1/bCV3
	S+77GQWwPL19iWv1cV8Izn9Pjcw+5MbuzqHTnEZwFQkkt6Ii+a0jHNLNunBtu7OkrtY=
X-Gm-Gg: AR+sD10rAU9G73wJeBwwMY5uhJGd+yaO7bWPKVn3AdHyyu9JMdNNom5d/TeoIIBAdXF
	onF7Rl6VY120qLw4WkvtKyGmxfElyNGQFkK+b85bqqOVHulAP9cc7hIuyiUEpD7whTHFbYuz+sx
	JGwU2nnKPUe2aGjNF0JQpsNyfzMsJhWjiMseR3L5uy/fxhgTPuPFMwGksXnavvtf2fIsChx6GoG
	zABLCo3ZRSeG/ro1vPN95aZ3CxVIJH8duwaK3QhGm1/QhRDSH8gcUU2nrYwXNrGtw8fuucWTGyP
	SmsYCSTgdryZBOW/vNlB5fcbVk0Ge3bf2PH9rPnHO98yoWJi+7fjVwuGdl+4RxARs3X+MBo6bY1
	ZxESIYPCK9rBRX9eFdTCyHbm/A6rGKYx6KbjDDnZaNnd0PscjyQVEZVsKt2W8FD0XsRBALlyQaB
	7QmJGRBIpJI/qYz0ezS08MFydqtx2bvtZb4SRJq+46BL8DKTN2NnLIbrmOxBQ/QO9/Yx7pBWAbf
	kwosoea2oFx6XQfD2dSQD/MqGFqb3c1rWjsh01e6SGpx70cLCnQP72XjLDtaEhKFQYId7BFUprQ
	QNijLplp
X-Received: by 2002:a17:903:120e:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2d035ccd3cemr5576695ad.25.1785371518417;
        Wed, 29 Jul 2026 17:31:58 -0700 (PDT)
Received: from alanhc-ROG-Strix-G16-G614PR-G614PR.tailb22ec2.ts.net (1-161-137-250.dynamic-ip.hinet.net. [1.161.137.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf4c0bsm17606485ad.59.2026.07.29.17.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 17:31:57 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Subject: [PATCH] dma-buf: fix stale return value documentation for dma_buf_set_name()
Date: Thu, 30 Jul 2026 08:31:53 +0800
Message-ID: <20260730003153.4030818-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for dma_buf_set_name() documents an -EBUSY return for the
case where the dma-buf is already attached to devices. The function has no
such path: it returns 0 on success, or the error from strndup_user().

kernel-doc does not validate prose, so scripts/kernel-doc does not report
this.

Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d504c636d..324f4f0c8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -413,8 +413,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
  * @buf:    [in]     A piece of userspace memory that contains the name of
  *                   the dma-buf.
  *
- * Returns 0 on success. If the dma-buf buffer is already attached to
- * devices, return -EBUSY.
+ * Returns 0 on success, or a negative error code from strndup_user() if the
+ * name cannot be copied in.
  *
  */
 static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
-- 
2.43.0

