Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718212;
	b=SW0JufsXJYdpOdDHDImgdnNcZcmgHi7iA83g6GwOzgOVMhnt6YowlI7NXYZbjvZ1Dv9l
	 mqvR4QGn+IPkszlXSA1SwBm2Eq/I4P6w6LRkDleAe8fnb9Y1MUygTewbMH6QSQOV4vr5D
	 j98JqOx5mm+/PWx3F4NLxai6uKW4XkRCPWFVfDcaUHsKjQSULgMsc3+BDxugrFqbJDxjG
	 cjlqlQxwmrUXv/qvT2VMYkskDrgALs2Pl5Af/IbUjhao8pvrydxt7H0EELNj8MqXHdz5K
	 AhozSQVfc0EYTF1cbnNHSqs2MxYy+gZTugWzE9FVvV+3i1BesQ6eookFkytmlvu9TyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g056Pcmp+8FL2GL1f0BbswD40eG44Du6pLXXgw2qNMc=;
	b=KwjfTTZxDBpy0TVcyXspNX5VBLKwL6+AAJPEnwYuWZM6QLCRe0Iv0KLqN9d5SVBqv6oo
	 YWRe0gvYpr/KQohv0BXUeT+Rw5Gb9Pu/CAyzWWjh+MuDMg3zL1DZvxmX1R5ifBnVxHLMu
	 oFbYeQuUsdVWWLE2WbEKKj7+03GE2Bvuh5sn8qmpWePnr4xk84UOkBL0okcd9g73N7Ni2
	 DnlVt86S2u+CzBQaNhzV74TPt7Itvkq83vdqcTW1A+BNxMRScDm9xzyzLjwn2RBS6q6Dz
	 OfvmF/jdi7N7Y8MczOepI8MWzlXdM+VaoajhZy44FYtJBMDq9dEiOa9LKc0ypkG715Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yGS+e/Gg";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30D1606B259
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 15:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30D1606B259
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGS+e/Gg
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4af52002471so9148685e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718210; x=1794323010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g056Pcmp+8FL2GL1f0BbswD40eG44Du6pLXXgw2qNMc=;
        b=yGS+e/Gg2brHmQIFKcvcA8WFE/0YsSnYABg8b6flh0yRDxsZdPoY0FBUgMzEO5Igho
         Tt0HjKIPsidWSIaKfIfEFEd7AtqGTTWqOH3MfzqeV5hSQDF/w7mTfbANMXvwdNMPPkqO
         IN7S/0BfoCCTiyA+QoUMCa8qhia0CIB2hyQmKGxNRO/V4MBBrK4qq6MsIM4ippXZ2TbQ
         1DhZbmfHHYRZrsQHIYFrfFguyxjFMxkddoxtY9mx/8zoXv489TAS4LEvAmhxhC32/O2M
         Y21ZBManZlkvsCPhVIcny++VOHOa2Ouq6E8G/Y4GnaXCorEpxOCiGu8pGvwj3Rgi3UfO
         hphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718210; x=1794323010;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g056Pcmp+8FL2GL1f0BbswD40eG44Du6pLXXgw2qNMc=;
        b=DkIBwm36DgV8CQjEk5GvJViZfe91VBINPmfoa8w61m1eOmJ7wHUSxZ4lh/EzLuNsJc
         cHXTNER+HsxG0pR/6zFQcnqPLXroq2hzxaiP0UsnckNyrPK/DAjH8Hey/Sppl1AxJRUk
         IhqqFHZRzzzQ2jA4VXYi83hr1d0eNYBhG37JFxNSIRPIMi++3CuhNtUCS8IzRY927yB5
         iJu9Z5Bwv9CpZ935cnZQRNJeQReCXrqoYbawJ0in88fGsTm1+BFatONPZ+Uty5wN5OH8
         K72ZOwxwRUQMttbDcZapgmjhar5OvHXgksKb4K6isGuFMFlnt9LKlclubxc/Jt8WIKzc
         XGGQ==
X-Forwarded-Encrypted: i=1; AKwUvBw90Y0TLYQLvdgqlVPZTrt80Zvp0k8+kNgZmj/iqnwhWWAZ2++oC/UKwetL4FZdgPt70kEzDsrLAMyNSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SkizuR2+ycFGHCcGZKurFMzX0IVp4bkIkLQKFNiL3WCm1hCzB
	wEznZeCRzBXJGhVNXk5KNJ2V9m3f0eQVXuHnSYyKkFVuBdwlPHPtyQju
X-Gm-Gg: AYBFou1ZxTdYx6+1beStj1aFh2rFfCRN2/nonMjbCYFCihK5/kgccd6WNHc6NbMlC4c
	IEobuh3l3z5EGVNkkTp2z+eT6m/onLqsggBxCoEWIZ/Kewboclj1CgPbEngys13ySAERJo0wk31
	UV2mOE8EWV5vYE3Z4hM/4Y/InZpuZTFzRZ+OfQ61MRUqt5mW3toP9DAm9OJNU/YlsBh/Zhi/dpd
	6MiqG/yqy4Nk1vWbWyOI2GB8S9IPAtgoAmcTS23w2/u5Fybkgwb6rPIIbGfs/BjTNYnJziJ5bEG
	oOxYbNSOIxUCTS/RSLNTd/wBr27+8lQJZT9yjRxV9vAS5V18vkzJOgmW4o/6DnBF7gjqBCfyJdz
	ZpCJbjsNX2FtILrWRwCVxAQXTLB0UKubu/lTS7BkJAtloneqEUnCSosuLtA169IgenJsVnANE4n
	9EsOsUFLWGU81SBvCRODubXItOwHrWd3JHrhvwqZFE/Y6g0nRWFRGUyWPFOqCQ+a9+eciAdbvcM
	rvrT3PsdZ2Z8Vm9j21hccD2C3J6uKrEPTKRQsDUCMLcMdFzzcGPGy7rv7LmrAF9xeT3NG9u0Bu+
	4Vu9oUuGwZXyMzf4/c/JlQvyp73Y/xBVaw33D3gBucUVam48oSyR6p22OBZjpeSdIBi+xyfk
X-Received: by 2002:a05:6000:2201:b0:48f:bb47:3d68 with SMTP id ffacd0b85a97d-48fbb473ee0mr3254396f8f.1.1793718209548;
        Tue, 03 Nov 2026 07:03:29 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:87e0:1189:3df6:ff07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm27317809f8f.52.2026.11.03.07.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:03:28 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Bin Du <bin.du@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: Re: [PATCH 1/2] media: amd: isp4: hold buf_list_lock while sending buffers at stream start
Date: Tue,  3 Nov 2026 18:02:44 +0300
Message-ID: <20261103150312.52812-1-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <bef07925-6a2e-48a1-a72a-127b390705d5@amd.com>
References: <20261026182442.229869-1-saif.elden.hatim@gmail.com> <20261026182442.229869-2-saif.elden.hatim@gmail.com> <bef07925-6a2e-48a1-a72a-127b390705d5@amd.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Pratap,

On Mon, Nov 2, 2026, Nirujogi, Pratap wrote:
> I’m curious about the sequence you are using to reproduce this issue.
> Would you mind sharing the details of the sequence and steps involved?

Thanks for the review. Nothing special on the userspace side, just a
plain capture; the exact command from that run was:

  timeout 8s v4l2-ctl -d /dev/video0 \
      --set-fmt-video=width=1920,height=1080,pixelformat=NV12 \
      --stream-mmap=4 --stream-count=30 --stream-to=out.nv12 \
      --stream-poll

The oops happened inside VIDIOC_STREAMON, before the first frame
reached v4l2-ctl.

What made it hit was an out-of-tree change on my side: the sensor was
started from inside isp4sd_ioc_send_img_buf(), right after
START_STREAM was queued with the fourth buffer, and that path had about
a second of debug sleeps in it. By the time the call returned, the
firmware had already completed that buffer and
isp4vid_handle_frame_done() had removed it from buf_list, so the walk
followed the poisoned next pointer. With the stock driver the window
is tiny, which fits it never showing up in your tests.

To make it reproducible without the debug sleeps, I put an msleep(500)
after each isp4sd_ioc_send_img_buf() call in the start_streaming loop:

	list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list) {
		isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
					&isp4vid_buf->img_buf);
		msleep(500);
	}

and ran the same command again (my out-of-tree sensor start was still
there, the debug sleeps were not):

- unpatched loop: the same oops (GPF in
  isp4if_alloc_buffer_node+0x37, RBX/RSI dead0000000000b8), 500 ms
  after the call that queued START_STREAM;
- with this patch: the capture completes (30 frames), no oops.

I'd expect the same msleep() to reproduce it on the HP ZBook.

Regards,

Seifelden
