Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039119;
	b=UtPPy0HkAbDRizKpFqQCQI08W8hIcLoUsTE4NN+BjISrzktAA9qHs0r4D2VnV4qQHM61
	 CmNAKWPYHTvksBCUxN853urPMQvvXjcWioseNSRCqvfS3//5UmpjQYbJzDON3rYqTIf3O
	 aRSFJhNpx7U+GDDiiaK9PgeAS9A9uMX/sfimYaj7iEPlOvN46tRibtffBZxcGOmW1n45O
	 Q6RWZwjaMDT2MI4Y6IxjSeZv8I52degvng791GMFAuWlZolhEP8X7gdzQeCdcISJ+A6Iy
	 aFNA1GONcJNx2/0iK4THyiy0xsbTAgWGyyHlt+d+lLoZdiHNToRhUyMKVwtvSkCZSoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjLdymjveFlr5AB8o2EJE8s7wJtnRZqg0vr0IyW9LqI=;
	b=eZJotfrTnmntImFRxcaFTjGMa0Mo3nRZg3lR0sMQavb7/9B6LGicHprxHoSv+cmFAURK
	 S6zY9PLdRIcNKdkLbLu2JjcgaddGF5JlmRERqdxcgYiyQWpfP0l8EC+iiYOhtvSByS+dB
	 gm9kHZ9Kg279F/+qOn0z/oPmk0N8QS2KVB4u7o1soq1/Gc2Sc+uk81dMSrIsxQMITeoYv
	 oZED3pF9fbnZfrLvLGRKIBbgJJhbZtsqWFI/lJ9O4PG+ri21Bq2myZD8zt1FxkafTsMH9
	 lM7lYNCMO6TnVeKQUIZaauutdv8FJTRDtMymgErw25Z+kOJaQXl7wc//6JH590mjmTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OOVKfHBz;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B874606A31A
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 18:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B874606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OOVKfHBz
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so1959065e9.2
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039117; x=1793643917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjLdymjveFlr5AB8o2EJE8s7wJtnRZqg0vr0IyW9LqI=;
        b=OOVKfHBzFKwn3Wl1Yd5z9CMzUFn7IfrDS4RhrnrA32AZcLNs97y9VRxUDwlhMJwkRh
         uAmUIJAktzuWlVxPjCUJEBNFLM6aRu9HDm6xH240xbvGkkB04bOqqr6cLrX2CzTxvjdL
         5Tkymv5d6XmgsylrDXsR1S2Pmhynu7WScrrza13lN3E809Rtr98XsxG+Vb7TffeowCs8
         tsA+XXR4drLBoHBVTiAwHw+n44LIQ5GbU12eP/AHtpLOAYrvCTP0/crT1RQMWONW/W9x
         GfKa6bXujJj5nQCk1LxzPk1I/x5HRVN7EC2MSoQdRTh8nRUGe9EjnZGkMCfZlWmN5RVt
         jMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039117; x=1793643917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjLdymjveFlr5AB8o2EJE8s7wJtnRZqg0vr0IyW9LqI=;
        b=d0FPTvKdQWq457xIM4jgipjhu3Zixgg3khfoyC1kqUZnUJ4UBrzDuBKPE5M/Sg4KXi
         ZKniKHWAQvN2FBNYLzllToqc2L8bxrazTW2fwbWdaDY/boUobEcokoidw/UTZMENDD1F
         Hm/h5FWfWpuItOJCmDeAAvEN/9WGK+ZsHM7gjN9LOaA9a9/beXTvGWSqopp/4Vs/+nXY
         da2NwRobJdj9JUPw8BtlR0U5F1TXTP4HoEz+Gszr2zJd2H8k+F4qms38ytmuRzdHMUpw
         sKknfPMYJoiAh8HzDI39qYFmFKL8fZBhqMNRSl1ykfxv/jYAPqJCMS9yaPZkwyzH59wz
         lPgA==
X-Forwarded-Encrypted: i=1; AKwUvBwigsNSVzotj8CntEjZpX25X0ueSEQW/rgtxlSCvFm7RMR51FlQcGuV8yQ8rEBbskfXwxp5QMdp7zevBw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI+CFhfzL9dmPRWcrjhCD0Ny8lPJoYU8CYiM+YpVSTY33ZIkDm2
	becZe3yFdeYubW0pRZrQu4J6w+omd2g9joPlqizc1Qhqpp3i6UhPEEQ9
X-Gm-Gg: AYBFou2gn+p+KhUzxMAXVJeizbwtX5spw6w7UWYRlJ5frjvdz1OykVQAAL7OmPd6UWQ
	B4cbXspGkQC9Lz/3LLSc3AUAtTh6T//rBamljLbQFZscZE1nSO+YWocw3c+YRq1yIGXM2VFeRmG
	1Chc8QQsXuAkZ8gFdsdxVqhJxSYg4j885nQUvhbXWgpSXF25/YUuAk5+YToODIHRJh/r0K7bE91
	tfvbpipylRNXhGBfpvigwXZ8jRJ39pTi+lwzjnBuMmkpNdyKaLYINmjOHoooGB40ZZPLsFyhaBn
	49FY7ki57HZlXTJwK1yrSRVoEErfwuH86weYc/+W/aGhxqFviHvqnXwXV0hCnsWtZcIPlZFkATj
	Pxx4hy1qmbcsIyPfyyLWYvF5d62yQHFRj8KW+ypabUzdkWJE2qnwogdSvVqXIuztAL5YPNIaY/R
	FQw8cVxWxcyI9I93B60OXe297LVQ5kUlsMq7k7kRVZuCZSxyfsE9hE9M+BI80QPlbzjkmvi83RN
	lJQt8Qcfqt24m6Z3sUDqIR8a2mYV8cxOMDq6JjykPqtsuvbjrD6tW8MeTNwRw==
X-Received: by 2002:a05:600c:6088:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4a35aae2effmr133448675e9.0.1793039116855;
        Mon, 26 Oct 2026 11:25:16 -0700 (PDT)
Received: from Termis-ROG-FLOW-Z13 ([2a09:bac5:521a:254b::3b7:76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm211673245e9.2.2026.10.26.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:25:16 -0700 (PDT)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [PATCH 1/2] media: amd: isp4: hold buf_list_lock while sending buffers at stream start
Date: Mon, 26 Oct 2026 21:24:41 +0300
Message-ID: <20261026182442.229869-2-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
References: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
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

isp4vid_qops_start_streaming() walks isp_vdev->buf_list without
buf_list_lock and passes each buffer to isp4sd_ioc_send_img_buf().
Every other access to buf_list holds that lock.

vb2 serialises the walk against buf_queue(), but not against the
firmware response thread. Once ISP4SD_MIN_BUF_CNT_BEF_START_STREAM
buffers have been sent, isp4sd_ioc_send_img_buf() also sends
START_STREAM, so the firmware can complete buffers while the walk is
still running. isp4vid_handle_frame_done() then list_del()s the
completed buffer from buf_list. If that buffer is the current entry of
the walk, list_for_each_entry() follows the poisoned next pointer:

  Oops: general protection fault, maybe for address 0xffff8e6944d97060
  RIP: 0010:isp4if_alloc_buffer_node+0x37/0x50 [amd_isp4_capture]
  RBX: dead0000000000b8 ... RSI: dead0000000000b8
  Call Trace:
   isp4sd_ioc_send_img_buf
   isp4vid_qops_start_streaming
   vb2_start_streaming
   vb2_core_streamon

The oopsing task holds the queue lock, so the video device can no
longer be closed and the module cannot be unloaded until reboot.

This was hit on a board that is not supported upstream yet, with an
out-of-tree change that made one isp4sd_ioc_send_img_buf() call take
over a second. With the stock driver the window is much shorter, but
the list is still modified concurrently without the lock.

Hold buf_list_lock across the walk. This adds the lock order
buf_list_lock -> ops_mutex. No path takes them in the reverse order:
isp4vid_handle_frame_done() runs in the response thread without
ops_mutex. isp4sd_ioc_send_img_buf() only queues commands and does not
wait for a firmware response, so the response thread is at most
delayed until the initial buffers have been sent.

Fixes: 2ccf48af2270 ("media: platform: amd: isp4 video node and buffers handling added")
Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
Testing and AI use: see the cover letter.

 drivers/media/platform/amd/isp4/isp4_video.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
index 856a2a0b4..58ea8d6ac 100644
--- a/drivers/media/platform/amd/isp4/isp4_video.c
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -567,9 +567,11 @@ static int isp4vid_qops_start_streaming(struct vb2_queue *vq,
 		}
 	}
 
-	list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list)
-		isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
-					&isp4vid_buf->img_buf);
+	scoped_guard(mutex, &isp_vdev->buf_list_lock) {
+		list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list)
+			isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
+						&isp4vid_buf->img_buf);
+	}
 
 	isp_vdev->stream_started = true;
 
-- 
2.56.0

