Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604912;
	b=iZOclZhdWhYnTrkVMMmj7rEzGelugnNC17U74u2qiP+rgs0mb7Oum3hwHcF5dNXi7qlo
	 byRRNMoSmkaaG1ljJW/8/MIXHF2QThHA3du3B6Y0a5Nv7R58BUqytZpAwvQK11RA42Vyr
	 WJkg+SDm9m7agwRmebvmaIed1x1Nr9V+TU27q9OhuxohqT671zSkKz1z29yWYeUAUxMy/
	 sJ7PVd/b+0Xuh1FWaYvlh2VUkEQE9hjBDI4LbWxffkElbxuaVqQWvmOwH8i3jAlphT2xC
	 KGs8y9JD1+9hA8XQjhq1kzBq9ISOrAjoXI8rGiCJ2MB116bMfsB/oUlhzULt+ROi/kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
	b=aihMTWWCaNLkxqglKo2Dca2dNaWtaWDYMriKYAi7tGVKE7TcFKH1CpHbfzIRUF7p8Dxo
	 JTlF5y6R0MhRGd78rihx4XPZD4V3T10lVYub98w1V2wDMror4r14uHYFASyYeNy92NLh+
	 enxMzhkSIe9L/fKGidAK7lIo+mTX0UBlRWNzrYbOPsHtbLW6zTrwXCe4mtB5iXLHqrC7s
	 e0F21mE20kIWP7CsUfNf9rxMXLzXhMrflgGXmUPXCWGXgjbto2+RC6pkI2asAlI++/VQF
	 tuDiWBbe58Gz/u7S30HOR9/00mzPOzcyF5LqudW2Vn9xltbHnGJE0RoNJlCVW6IyKYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDl04GM0;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC299606A681
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC299606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDl04GM0
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5126505cb3so723495966b.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604910; x=1796209710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
        b=jDl04GM04SUvczo1Inokqv8zZl1+LPyhzAvzrssrJVHMKh5h4HAtetz5THXEN9r5Jl
         23djp7SiAZKlGJ4msE9uSBT7Vy4yf3Vl2P/5w9iaVr5b/O0p58q1DTB7zFue0Rcd435W
         zDgdn0wg91yg+0r1tZhw/UJEE4wHT9QYY5VJApULT++uryUXC40omFv6GxVSWvh83g4P
         C89jpRezO0P3Edi3WQInmgAfTZGCXX4Xd6GXJ5BpAegvevJsaPas5TySxpkasLb/5JuG
         RQ/1usTNG7/my5XvbZZ7ALJ1sr/Gw8ew/4LwvE6kBHjJT9M8P8JYrshgkoQywQ4hTa/e
         is1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604910; x=1796209710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbKQrYeSQQjIG8o4PeFfuBxBDq4T+YpBKC3L5X8LsTY=;
        b=pQHMqYb8xYJRH5jGp00KIrxD3SDcoET6mwsq1CZxXoGQhLTVgvSxyph/OQGONEIRHT
         tD07UTJzDN+UBPRXvazM8O2jZSkKeyHAxkNDoVgSsV2otesVlcTUq5wR+BqEtF0R5NWm
         NX451A4B2xpo6qhQygx1suRVv9Xf7D7b3wVjPEt5WVdo6MW7UL08/sFWoPt0jSvxtnpT
         8tcUycIw9rdKqPB5gpXeq1nc6mLT2XKYra4nh5NVu8Ow1RZTc1fojPLnu6up406UtauY
         RhYFqO6yK2uLza2LrxBiTJHncszdG6kMxBCJtbVh0j4Zdno/JfEbrxQwnBuhErQEg9te
         RGFQ==
X-Forwarded-Encrypted: i=1; AL+hErFXhYBBXUwrLO1rMlFGR5228YF8K/Q4mzBegnhtfo8QZqUZRfORw5h0tVu7hQ7bBp4UIwB/QfymUVW9tA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ukv6YUAX6DuWF0dfU7G4dcUtAbiRQnJNARE8bLr+sfAJaMeRg
	iSIYJo7c4dJhNQQHofzIjApmG4OPZAilCITtvfkIQL+VKsV/V9tVCtlu
X-Gm-Gg: AZFdTZek0NXNrDLsNVXJGgMkz48G+TdcK0D/SQ1+Gyvd9yzpHwOkgHK1dBQ8wXPm1Fm
	XgR0lAFPWTT09Yv233moQRwc4OkN0W71gFsSd9Iqpv6uM2WwNmEk88RJCU6M0I3VlxsAwTY0BFT
	ggfKLM2470Rvxa5D4GTejn5O5Hyvez8y0CMCCk6qUoLaWiaRJnZsPEI351j2NmAsE8TV8T9JJ7T
	TR7ykn7VLD3KcMRzJWK07F60zAAp0S4ErMmWztXxwKwmaqLDPYMJtFmZt3gvfpmDuK5LRnsLKKC
	EhDx1H5u25cW6imxe8MPWNOHDeiSXaQQEpyo8vctBYJnE0+tzGxGc3LyYP4d7J3yiXsE5/vnAIP
	ijPamTIue3XgIGibsYvtQI6MADUExkR5AoG8PBhYOSagu4ISYAzQ0bNnpTIoS0nTj02rt9puVb7
	GWPl/8sltqEgdAkYKnG39xAEUa4Tvo8GxA9Z9huX723yI3s/PAKLLtK7bRKQAbEi1B8DuGCf7KR
	A/oJR12LviBY7HP+6VfiDCpxhU9unV/pSDslMZtdeYp1r45sPby49aMMe3wWBc0sYISqRVa/4c8
	FWoVsgDlgLV5LXV/eTPm6oHtpsCwTZpZx/2NdqUeTtFJ323Ga0EC6MieKwB849cqOtsc9rvo22t
	hopFUKB5DMQ==
X-Received: by 2002:a17:906:5593:b0:c40:91fb:b76 with SMTP id a640c23a62f3a-c513ab48008mr1115543266b.33.1795604910057;
        Wed, 25 Nov 2026 03:08:30 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 07/13] media: tegra-video: vi: Report stepwise frame sizes instead of querying subdev
Date: Wed, 25 Nov 2026 13:07:44 +0200
Message-ID: <20261125110750.223628-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
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

Update tegra_channel_enum_framesizes() to return frame sizes supported by
VI instead of forwarding enum_frame_size to the remote source subdevice.
This also requires switching to V4L2_FRMSIZE_TYPE_STEPWISE with a step of
2, since Tegra VI requires sizes to be divisible by 2.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 23 ++++---------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index b523750725254..ed3e1e91baf12 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -311,29 +311,14 @@ static int tegra_channel_querycap(struct file *file, void *fh,
 static int tegra_channel_enum_framesizes(struct file *file, void *fh,
 					 struct v4l2_frmsizeenum *sizes)
 {
-	int ret;
 	struct tegra_vi_channel *chan = video_drvdata(file);
-	struct v4l2_subdev *subdev;
-	const struct tegra_video_format *fmtinfo;
-	struct v4l2_subdev_frame_size_enum fse = {
-		.index = sizes->index,
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
+	struct tegra_vi *vi = chan->vi;
 
-	fmtinfo = tegra_get_format_by_fourcc(chan->vi, sizes->pixel_format);
-	if (!fmtinfo)
+	if (sizes->index != 0)
 		return -EINVAL;
 
-	fse.code = fmtinfo->code;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, NULL, &fse);
-	if (ret)
-		return ret;
-
-	sizes->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	sizes->discrete.width = fse.max_width;
-	sizes->discrete.height = fse.max_height;
+	sizes->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	vi->ops->vi_fmt_align(NULL, &sizes->stepwise, 0);
 
 	return 0;
 }
-- 
2.53.0

