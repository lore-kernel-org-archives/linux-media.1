Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCA740BCAD
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 20:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786480889; cv=none; b=jzbE2gqRLIC/arHqFy5k3OL6kOnNAHXPjvNvZWzp154AWTrzph/a9INsBdc/HaFmfglrcpiT9fFBUzYjvSNDqLp6IkQqxezB27WLOOR9hFsBdfTsQ17ehIyLOpOINsPMl59JFC0BlxwCPiyatTI0BEEUWmBlL6eSBiZ5SfdTUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786480889; c=relaxed/simple;
	bh=p2h9krMxZkoZc/3Sp+Bf7UgOmB7A/VM67RM5yQWAkTo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DXTuFH9HggTsIg4JZPxRuOf4KjTTUMZzScuSl1rRemLkGgUvIMOaIVyG5fS+aUsX5WI/h35nuj0pwWPOeuEONgL7xvHLy0u097NGQVWp2PbTDEj7AhiXBwnshBX4uNA0N0fo+ML8KfP5D3Wj6r3s3PPeMksY0warNGYaT33/NCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H6DzY8Yo; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H6DzY8Yo"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so411078a91.0
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 13:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786480888; x=1787085688; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJ+kHjelH5pg9wQKl1OmAN9lbWOp3U72jOs17+JTkO0=;
        b=H6DzY8Yo6UYDicWd5kT3DeBZV3YQu9eVquU3hGXkinNgDFxzTXrLlK/lUsaAB6Zv3t
         f/O2EV1eY0Nos6s0GOxJ3k2RXkXALfdBpm8dlbJ1oRKnWfpF/Z+zfBKyHCTeecYyvvLW
         tPZr9pNypCQeMF5ihWTB7Wy8t3OtjZgDKeqzkI6YP/YyA3FJBjv8d7+LeKKaEW3S56Y0
         cx2zXwU2Y/x3X/3LRfELzejMHb3k+8ug4FweGNt1HrhkGfhyhRYgz88BiRgd8NdtW35j
         wG8ckMdIapeM/k944b67DjtX4tVGWHIETGq9xM3Of+zVzSyBBEsAYHlT6qlTnhFnyPMr
         irfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786480888; x=1787085688;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJ+kHjelH5pg9wQKl1OmAN9lbWOp3U72jOs17+JTkO0=;
        b=MAGDIi7qSyJJG/yREv3SxTVNCC/z1iRZUxo/NrMSypYKnCA8qC+Vq0mirqH2LZhk77
         Xu4DeMd5qgSvdW8+vSqn+gtVoH0rUpJkHv+O0NEHLrwoKyxBLIhcYTPmGH8YUr2ZTlq+
         ziPBwDyVCznimzqpaQgauTZCE1zdIBXTlaI2Xl4MOCS9Pbrb0Z/lR9VR3okbu4N+wfZ3
         HRgoyDwjDtVJT8tH9yuGfOvi9DbZa2qf3ZVTMoLoVNiI0ue5a20rP9DtHXrmFNsp5I9d
         UdbCyUaYeqSNOji9aGvVONtcOIA4Tuwu0t39+Uo4e5w6h0Ig6YJQWC7ZGFK9Aj6ZjPQv
         ha1w==
X-Forwarded-Encrypted: i=1; AHgh+RoipWtjJmGCHZPb3EaTjTgX7Wv3mejQ2Zam7iS4EVbNrVRsxxrdVs0h3y/Tty28Vqvn+q71QBSw9tXkig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWoxf85lgY04tQAuvijeRtHs5JmWJFaXdZI5e3xYXrZuM7QEav
	LRcfUmBv65IZo7CBhwRXXrkIiZbvZ0Ymi9EGbznfsuInVTowWNSsiyPCja8bVEktsR/oAfwS0py
	2GZ9sfCJ6ly0QPhvv8A==
X-Received: from pgvq11.prod.google.com ([2002:a65:624b:0:b0:c9b:f0c9:631a])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:bea6:b0:3c1:b9c:4890 with SMTP id adf61e73a8af0-3cc2ba60c41mr7899605637.22.1786480887687;
 Tue, 11 Aug 2026 13:41:27 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:41:23 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260811204123.3198370-1-tjmercier@google.com>
Subject: [PATCH] kselftests: dmabuf-heaps: Open heap device files O_RDONLY
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: christian.koenig@amd.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

Write permissions on the /dev/dma_heap/* device files are not required
to issue ioctls and allocate dmabufs. Applications should be opening
these file as O_RDONLY. The BPF dmabuf_iter selftest already does
this. [1]

Users are pointing to these selftests as examples of how use dmabuf,
and encountering permission errors on systems where write permissions
are not available on /dev/dma_heap/*. Apply the principle of least
privilege to selftests which open dmabuf heaps by removing the write
access mode and using O_RDONLY for the open() instead.

The same is true for the vgem test using /dev/dri/card.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=v7.1#n49

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
index fc9694fc4e89..45b420e37c97 100644
--- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
+++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
@@ -48,7 +48,7 @@ static int open_vgem(void)
 
 		snprintf(name, 80, "%s%u", drmstr, i);
 
-		fd = open(name, O_RDWR);
+		fd = open(name, O_RDONLY);
 		if (fd < 0)
 			continue;
 
@@ -96,7 +96,7 @@ static int dmabuf_heap_open(char *name)
 	if (ret < 0)
 		ksft_exit_fail_msg("snprintf failed! %d\n", ret);
 
-	fd = open(buf, O_RDWR);
+	fd = open(buf, O_RDONLY);
 	if (fd < 0)
 		ksft_exit_fail_msg("open %s failed: %s\n", buf, strerror(errno));
 

base-commit: 9a11db68872055e6ead919bad04d6330851c522d
-- 
2.55.0.679.g6767b8d81c-goog

