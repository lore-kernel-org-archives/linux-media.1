Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699089;
	b=yZxx6RPKDMTkx4ZBCjlWriFyvgaS5Nl/X9O2mIrX599/8IUlYr6xCrwC2Hzfyky5smxS
	 22oZR6gJ2O/GixoZHsTMOqX1bwVmlOT09iMUOnEESQ9hVW2+G3Gt71J1aPs8X/zdUka9+
	 2utAdzGYP9n+NjbL+Ukww/b4Pv6HPLQ6yo/qY6XumXJyAOLQCIY5h2t7PMrjvzFz9W3di
	 u3IamBgfz8Z39jGmxkcNjLfNJrZDQYmr+65hO9AcsXpwMeh7aEa1VfdTn7OItmuZTiCK2
	 LBZtWXj0KTNMN0QL2T6B7DyhUuA/WSlXcpuH0P7N6/ikX2G8Reb+TbOycHdPPpvBmvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699089;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=a5eiw90JNCaLC4Ef+I5J1t6v50x42Rr5WSiSG3Fy+qU=;
	b=YYbd+qpOVescubT7iS2vpwVearLfY2QP5eL4MtHlIsL3lG4iFLSc+gfuBHAeaZ2yb+/P
	 BZn9V41bkAbIazG+zrzbIn5uLt9cmI5RFxCJlOk2ZpEstk0enbj/Boc/4mJpH5lJeRzhJ
	 1l/y30es5UYgqRgPn/X41zwsEfWjiGuOSfD4xGgrzqF1S1SAOYDU6YgcOzp93eMq2bIrK
	 PJi3UYWzZKFwExnomVjgICagP2m9V5/CexdwkZLr4EUBdI7rH0yI8/0DrC+UtmJ0zrFSQ
	 kUJ0+nHNUbMVLr15Xx86E6SjePWQjXAsJF2q91bJcT7Um+MzijzAI3YoseD7gBrwfvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pINPwOll;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EFE606A31E;
	Thu, 26 Nov 2026 13:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2EFE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pINPwOll
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=a5eiw90JNCaLC4Ef+I5J1t6v50x42Rr5WSiSG3Fy+qU=;
	b=pINPwOllsw/8qbuBJ3J2sxno63aCAB1bew+I1NiG0bfU3XmQZt0DwGlZJnOAnu
	qkm9OVW0HAuylUZQmA8hD7zliGq3+xl7VNB8o7l96bdRn4XE/1KG0SD3b90WUvsN
	S+cKMRSmi1NNxbl39XwpArnRSbM49YkJa0MC6Ys7YjUG4=
Received: from piano.lan (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAHuqFuMQhrRGYOIQ--.37185S2;
	Thu, 26 Nov 2026 21:17:39 +0800 (CST)
From: sakimidare <ssmzhn@163.com>
To: linux-media@vger.kernel.org
Cc: Xilin Wu <sophon@radxa.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] media: iris: support decode-order output on HFI gen2
Date: Thu, 26 Nov 2026 21:17:27 +0800
Message-ID: <179569904757.642669.1138193352390349179@163.com>
In-Reply-To: <20261029-iris-va-fixes-v1-1-44a2783f782b@radxa.com>
References: <20261029-iris-va-fixes-v1-1-44a2783f782b@radxa.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:QCgvCgAHuqFuMQhrRGYOIQ--.37185S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF4rJr18KFW8CF1UuryrXrb_yoW8WFy3pr
	43Grn0qF4xGFyfC395Ww48XayfJan5Xw12qr4F934jva9xuFyDXr1xKF48XF48WasxGa4a
	gFZFyaykGa1vga7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UVnQUUUUUU=
X-CM-SenderInfo: hvvp6xrq6rljoofrz/xtbC0RNFcmsIMXP6iAAA3m

Tested-by: sakimidare <ssmzhn@163.com>

Hi Xilin,

I tested the series on a Xiaomi Pad 8 Pro (SM8750, Adreno 830)
running Debian forky/sid with Linux 7.3.3 arm64, qcom-va-driver
1.1.0-1, libva 2.24.1 and FFmpeg 9.0.2.

The tree is a downstream 7.3.3 tree with 295 patches; it already
maps HFI_BUF_FW_FLAG_PSC_LAST to V4L2_BUF_FLAG_LAST, so patch 5
needed a one-line conflict resolution: the recycle condition also
checks !(buf->flags & V4L2_BUF_FLAG_LAST). The rest of the series
is as posted.

Test results (all decodes completed with rc=0 and no errors):

VA-API:
  H.264 1080p: 150/150 frames, 23.4x
  H.264 4K:     60/60 frames, 10.8x
  HEVC  1080p:  90/90 frames, 23.4x
  HEVC  4K:     60/60 frames, 11.5x
  VP9   1080p:  90/90 frames, 20.8x
  AV1   1080p:  90/90 frames, 15.1x
  AV1   4K:     30/30 frames,  6.9x

V4L2 M2M:
  H.264 1080p: 150/150 frames; output bit-identical to software
               decode (framemd5 cmp)
  HEVC  1080p:  90/90 frames
  VP9   1080p:  90/90 frames

Seek (-ss 2) decoded 90/90 frames. The H.264 encoder round-trip
(1080p, 60 frames) also decoded correctly; the new deblocking
controls (h264_loop_filter_mode/alpha/beta) are visible on
/dev/video16.

New decoder controls visible on /dev/video14:
  display_delay (0..0), display_delay_enable, av1_profile

v4l2-compliance -d /dev/video14: 41/48 passed. The seven failures
are:
  - missing bus_info prefix
  - missing V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
  - colorspace missing in G_FMT/TRY_FMT/S_FMT
  - REQBUFS on the second queue does not return EBUSY
I did not check whether these predate the series.

dmesg shows no Iris errors, faults or resets.

The Tested-by applies to all five patches.

