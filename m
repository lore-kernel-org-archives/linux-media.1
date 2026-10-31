Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443495;
	b=wSJSziZBLNmsa6Q6I+PbHpVRI6BePf6w1rHvT1yXHIEmyk/LjMQ3kCA7pxi4EvrxaSZk
	 9H4YR8FhZu1Pgsvho583LS754dWVhDjgdeIjbYZExivpqlpvJ3aJChv5PPx2/EE7o/mU4
	 6sZxLYg53A54Qo0lVU6cnHqBgLVUFVmE1LA0fZ+s6Qgup87E06SUMPOPZ1RVfPJNgRADZ
	 YYAGwNLiTqQ7dkZSI4ZEqrdc3+xDxmLgzSEvWn0D7xAZ/l6fUeUf20S5dSuLXEApGXp4p
	 /Jw9rgkJydhmPxBvE2bCg9RLqZBZlMNJSNvNzYk3JQ1q8QWkEk55XPUxB3Ea8QUs1Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4nZEer0OBORnNh+HtOSAonBsrwjZLbFagqy2gDjha3U=;
	b=QoAx7rr+P6xrYrXbY+m2TnCA6lrT478DjYkeC7gxKr0pzfy2SrmXlHXLUYE/dRXDr73X
	 4sM6WRSmWgeJWUxxTtSERGH45UBLlowe1Gc7TVpKNdPcp9KbyQKhanrXyXzRAej7t/7WI
	 ZRElMIFxNytAOqRJPRSQUCEaLr3KejxK2+1L5I1AQsYZUBE+jvoayh660UBK9cB5bKAQ1
	 RhrofXMWBIOiLB+bLDaA9ofwmz5O5LZ77WWoioUMgPbA8mmkIPqu/88CBThkadmTyMoQz
	 YMec9QHnPS/Y0ViTdqF8bfWyJT5buOqHZmYgvNqVF3MR1O5tpUTnTXE38iDXfUND3jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UcqEXsLF;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44E2606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 10:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D44E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UcqEXsLF
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1079390f8f.1
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 03:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793443493; x=1794048293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4nZEer0OBORnNh+HtOSAonBsrwjZLbFagqy2gDjha3U=;
        b=UcqEXsLFGpK8HluJzwZWCLWSIIOtM1AqH30p/xVJh+ZCGnhCRxz2BiAmobnXB5MK1b
         C8NxZii/6Ye9x8YoayP6CtCNMiFirmeJ2uu6lrMtSw/FM1dON+/H+7suN35Hke+NMkx6
         8xP3u+LG/e4fDGo/QRVS9cyPaobpsrM+7CC5buc7VV1JrqWkKH4qelgddG9lRpsdyoFq
         so16ADc2UqjedDxp2XyPoZ8UoTmBY3xnh+VZlgfQiW/cn8eWNOnNTpqrUBkxsRBsS4df
         7Yqm4R9ItofReQI2nzy4+116xn5Vc78Ti66dF3eFr0JCssIbdLWtRluFZdovh/x8BEqL
         2G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793443493; x=1794048293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nZEer0OBORnNh+HtOSAonBsrwjZLbFagqy2gDjha3U=;
        b=revocT7oC2rmlhKBGj33E8q5wJ9bCiQpPP7PiwE36BdQtTVLCLjC5t0+6768VIY5Pn
         KFDSDeqTp1ypzuuxNOiGqojIeP2zyrJc4xD6cXF76hfpEoERA81fG/Hgt+0VdXzho9xb
         8v7zUd9Zj28PJnYhmTr7DuU1+SOX2xfVPi6kVorYu7YnN7BVjdqAnnfg1AbECfQOM7vs
         YFS1hzHl7M5392QRorMXAxJFCp3Nm22wsigXgEAkCenl+rymq1QcF+eA0Z6BwkTpHDaA
         YNe1uW8rDeTG6LCnY2Aq30Cyi4zUMKUIQPCIivLfeUI0ig2tp2qhnCdF1w6LxkxrBCPa
         zy1g==
X-Forwarded-Encrypted: i=1; AKwUvBz/4OwpXDYDrtCYxxR6xmCmI7sVgO22qiFq2qB+DzLLFzaKJXIc7jR7Iii9aggWo5YSjH99rHMM5e5HQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLVfxmzivncE3LPEK81gHKAgm4Q52f1E1TIsNMljxL1zfbTEY/J
	bM3u3WawQP4HsU1Nq8Qq/Amn+hk6X41rGG4FT86Psr278r6XOpIgwrxH
X-Gm-Gg: AYBFou2QuLrqP2bJK8OipdI6olaIAELB8VvasRoZlxWCZ8i+lsbuPaFQSmt3GR3o8RG
	un8yFBAhnHrrFx21WLGo8DhhB9xIdgXD4p1jCwNqu4SHBJgwve46QvrUJaaXmkG8UfbXKp6Gmsh
	O26oKWMUaGUwehCzF3+XdaZ4tXXnQApsMul+LjBfBoFS4vG+B0+Q2Kpy6NXVBVe2eETCq7vFQBr
	ERyq3mR00zPjhAkQAyi88tT/6Gp7qs321EAGbS90nde//IkCpOBQMDxTqPkLHxdHIX/aNPfiDQ6
	RE5kd1um+zfz5yqqXjf/0uLL+3oUQkb7sTWE0s73PRa2I6enfFqY7tqJJ655W8SBUvafGbv/KyD
	kjFwX5pCvQvXK3UcehnlIuZAFNt1I7vmOCmwDBVQBE+RMa/kJyDDn6VGXqKol1OUcCPPn5+plkJ
	aXDvX2FmAwEOseSGrPaShvt3aNwjAxTVx+cOK/skBUQlDOUSKNuZmAp/+lMo0/WnwQmHP9ogC90
	7BikbiseP6vivmCJln6SbeMWsoAhzMACtyXfINeSwPjg79wkETwXTyxqVupnfXUaKLQKGyqsZKq
	VuPJ2iR2Dix6W/bRk9NcV181pHrAaAlP33dPf7Ph7y8mQ+qzm6Bfxc4HE6RmQNCULIGp37RJHtR
	KHyeRuZ6g8nxZaD4QRtqSOYAFrl7nm1yfPO7EJKLuDZDUgcyXHuUhQJyLQmJODp5AoYVYhagHJX
	+fQlmT5U54NYf7Xu9SeBjTeRBLQbSCOig=
X-Received: by 2002:a5d:64a7:0:b0:48e:5e1f:9a36 with SMTP id ffacd0b85a97d-48e6e50191cmr8399741f8f.42.1793443493010;
        Sat, 31 Oct 2026 03:44:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a81d-e001-9c9b-db33-f166-0fda.310.pool.telefonica.de. [2a02:3100:a81d:e001:9c9b:db33:f166:fda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm8093899f8f.10.2026.10.31.03.44.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 03:44:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/tegra: Fix dma-buf reference on import errors
Date: Sat, 31 Oct 2026 11:44:39 +0100
Message-Id: <20261031104439.91346-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_bo_import() takes its own dma-buf reference only on success, but if
mapping fails, its detach error path still calls dma_buf_put(). That drops
the reference held by the PRIME caller, which then puts it again, and can
release the dma-buf file while its descriptor is still installed:

  VFS: Close: file count is 0 (f_op=dma_buf_fops)

Remove the unmatched put.

Fixes: f5b8794e17e4 ("drm/tegra: gem: Don't attach dma-bufs when not needed")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2: Clean up the commit message (Mikko). No code change.
v1: https://lore.kernel.org/r/20261026055842.96484-1-kmehltretter@gmail.com/

Tested on a Jetson Nano (p3450-0000) with CONFIG_DMABUF_DEBUG=y and a local
change that rejects zero-byte IOMMU mappings to force the error path. Without
this patch the forced failure produced the warning above. With it, 100
consecutive failures returned -EINVAL, kept the original dma-buf fd and left
no dma-buf objects.

 drivers/gpu/drm/tegra/gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index f76af73..ed35a34 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -502,7 +502,6 @@ detach:
 		dma_buf_unmap_attachment_unlocked(attach, bo->sgt, DMA_TO_DEVICE);
 
 	dma_buf_detach(buf, attach);
-	dma_buf_put(buf);
 free:
 	drm_gem_object_release(&bo->gem);
 	kfree(bo);

base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
-- 
2.39.5 (Apple Git-154)

