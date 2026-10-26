Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039127;
	b=zLNjloNvynixrhunJ9uT6Xk0msQwjiUFYy8VVUdRtf6G7aYwnmCAOyhSszp8JD7Wky/r
	 nQpVEPcAg9naMP2vlIPOxyp7TwT9E9C9K8YaTXRSnha63oO8mD6fJA/KGY/T6mUWvzPqC
	 FEut26Ea7LC/6t2lFfy1sRdiwgsaj7Z/MdkZyFPNbq+RNP0401NNvaEqHXiEDNlolSq0m
	 yULixFqD2lHxkpOdHr/bKku8zwnho0OZ+VQb7ItwwBfpiTa/LvY1E4HdWAPuADTbjQddJ
	 HwQiMQ1UIVnW55DLckJOdVfB8DWlQlbapFRF2sXVE6TQO3b2doHxyNV/l2PTlhknMIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=as4dLySM74JHCwhJBoWvbRErIcyVkS/DDlAos+E9LjI=;
	b=q+o+HQyroDh26zADdB3d6dYnRJvBwLH9mMjKA9CAqe+j2RiJQOn2oxKFLi0UF3k2QuZm
	 JNWdZedMlXCPtR1L4PNWdB18Yl+LL3IXkNhavwj5oeNIiXELqETMpF7oJhEU3BqciDzeH
	 REv28W4/4u2JR8JnnOZDBAiRPajpb3XFFp01eh2fAoKpFhO8YzZUH4Y8WDum+Jn6uudpd
	 gdb0Yg0v6bbeR0MANqA3/UIOfIKelQy9lvgQKrKLoXXkY9NduOuD5b7uoOqKze94t5ePs
	 zQ05h4vL/tz1VSrpXs0YjEIXqV7Sr/jn0GzV/z83BuXjl6EvA/Eh7u4/a8C25risi+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nk91qd8p;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2B7606A32C
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 18:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F2B7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nk91qd8p
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a7a3b29c11so562455e9.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039125; x=1793643925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=as4dLySM74JHCwhJBoWvbRErIcyVkS/DDlAos+E9LjI=;
        b=nk91qd8pvq8xezj42jZxVpU9jl2j+zvLTxTLxQaFC5yOZ3jXkqg0FxUHD5bGNKy4ng
         bXso+D+pCubRwg66hAUHUPLmXz072+KDsyJVA81SMQ6MrLOAwfVVjnhJzFLTk+rhPLBC
         fs+lvQGpyDFxCpVGZudqvbszxGKMBUofGnliCV6SwHp0/a42GoWXwjNNn+8Y7SooXhF2
         lrEiApXOQH3lQAPVHyq87TSfRRdPs4tXVuPUF6m4Jly+x9BtO0LwRiGZmri2hpoH5Sth
         E/WPRLAD067fNpM4yu33TQtBoTsoo9qZMip5ARq802PkC8FuQmS+3VOXM7DJOCKElzYy
         GxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039125; x=1793643925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=as4dLySM74JHCwhJBoWvbRErIcyVkS/DDlAos+E9LjI=;
        b=T81fHPL8ZGi7+z3mk4nvVdaRcStOPF1J6ddkpJ9TIuAWNRhk3KNiVu7nOBW7HKKEh4
         tl97V2Wzxe0s1TSXty5aLvQuX2YFYZjdzg7ANqdadIPgMb8rr4IIfpc7aL705cLjFjeh
         u1Ppw3S6YeEXubIrpK+zH6hBfSMJEQchnKaasnNo2eO+Z0EWGO3asw+M01xpFuxH7laf
         ASoKphinfJBu/XnDpzbiVY7ewiT9Iy50H00PFXYeFaPS2crfyxTfWmaMykQrnCStACTJ
         ZOhE7kRRo4eXuAp0P11iJsMfgsyqfYsj4Hwm6bDfs3i36vXlRuSdinjCFj4W+aA232ey
         BGYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjiEpIcvV/Pbo4w42nivHViBVhMBVXQFSnl5isoieyCoduIdNlcDjaxNJAcPiUf4twsCOWNMhYhpQDFQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLyX8NTLExLFElGz6EKBlT2szaSQVHxZm8JI2YIZyQJfD9XktNy
	GpAGXey+PylwCKSerqH2iwx3ZkWZIMGVGPAdz9tFDOpHMSExu+Wy2ZDXXsWRc3QA
X-Gm-Gg: AYBFou25EZyjUeKdN7ZorkJlp3EBsQfWhq0Lwi8v71wmylU6Ec7N0JbqnVmmwB21ALY
	/qqtwbnW7hbrIGeTTRzMdOBPparKQfCxnS7rk4SYCApg3OFZ3tudCEKP62tmmmBoZLuhgUTdjvF
	QzH9iZLXMNKLsefgTeEFcbFTppBGWWxaRSwnXcDz7wEJcCQ5GRvEG5h73DTLBk18FsByds0sqPE
	sFhx/I3klj0eX+FlqhtBQeqYU41Ix2Ducsh/+9j2untRhBaDuhNczK0Lqdzj4gMZqSy0FpbjjMN
	fOWKbvyaMQgXuBWnTdmUEv+LHHOdcfRQT/Py0Zfv8OMOem+PGp7HkZdaYsWXeUrDxc+L0wAap4v
	7z9aAQijArznPe/RfzV/BMPMCrffZVZFF6PogFoxHBKtH5uTbixT/bd3fJlwEeDqO4Qh9mG1w7O
	XdtL3n7Qrsv7f3dFAQkVTRwhd+9r8tj9/l+Ju2dZpFveHQ5ekp3KoWST87OrFntBpyCGlwOuNRS
	Jhtu91+Q9DOwfD3wMfN4wAeQi1ip94m/GG/DuiNYybn2X2CGMg0BB1o5CSQ/Q==
X-Received: by 2002:a05:600c:a114:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a35aae5c22mr101769385e9.0.1793039124430;
        Mon, 26 Oct 2026 11:25:24 -0700 (PDT)
Received: from Termis-ROG-FLOW-Z13 ([2a09:bac5:521a:254b::3b7:76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm211673245e9.2.2026.10.26.11.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:25:24 -0700 (PDT)
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
Subject: [PATCH 2/2] media: amd: isp4: return capture buffers with V4L2_FIELD_NONE
Date: Mon, 26 Oct 2026 21:24:42 +0300
Message-ID: <20261026182442.229869-3-saif.elden.hatim@gmail.com>
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

isp4vid_handle_frame_done() marks every completed buffer as
V4L2_FIELD_ANY. V4L2_FIELD_ANY is only valid as a request from the
application; a dequeued buffer must report the field order of the
image it contains. v4l2-compliance therefore fails the first MMAP
streaming test:

  fail: v4l2-test-buffers.cpp(419): g_field() == V4L2_FIELD_ANY
  fail: v4l2-test-buffers.cpp(1280): buf.check(q, last_seq)
  fail: v4l2-test-buffers.cpp(1735): captureBufs(...)
  test MMAP (no poll, REQBUFS): FAIL

The ISP only produces progressive frames, and the format ioctls already
report V4L2_FIELD_NONE (isp4vid_fmt_default). Use V4L2_FIELD_NONE for
the returned buffers as well. With this change that test passes.

Fixes: 2ccf48af2270 ("media: platform: amd: isp4 video node and buffers handling added")
Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
Testing and AI use: see the cover letter.

 drivers/media/platform/amd/isp4/isp4_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
index 58ea8d6ac..b8af3c766 100644
--- a/drivers/media/platform/amd/isp4/isp4_video.c
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -72,7 +72,7 @@ void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
 	/* Fill the buffer */
 	isp4vid_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
 	isp4vid_buf->vb2.sequence = isp_vdev->sequence++;
-	isp4vid_buf->vb2.field = V4L2_FIELD_ANY;
+	isp4vid_buf->vb2.field = V4L2_FIELD_NONE;
 
 	vb2_set_plane_payload(&isp4vid_buf->vb2.vb2_buf,
 			      0, isp_vdev->format.sizeimage);
-- 
2.56.0

