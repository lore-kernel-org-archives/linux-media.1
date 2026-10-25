Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943102;
	b=DtiBHWZ5FgV4+Ued7x8nB+IwbIn1sy9nzexB10FxmuisIfJXjmv/ZJOIdYJD/x39CMQ7
	 B9tySJsfWLakiBMCBbQjuYlY2seMpjCtVSYMomvVWYb/uYx0HlZY5lNdHHzYci0HogASS
	 ahbtK5QhpVC1A87m5QonZQ28dduA3qi9MVJ5KigK0TH/IO1M5QEcjhcxavPKKYnbDfmMt
	 42QZU+nWx3qzG7B5mwzb9s2vImuNj4VqzuWNHmvdIa8tS4J/5885qbjDYXdhPE9rVupw0
	 wkLNVaxnyTNZwg/NJHgb9qVOmycQVNcQNGG6GrD/INkCIan5vGh6VhPRY4yiRMtLaDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N0vgeH4sze1VHMGmMqh9MlIMZCyUAgrFNnWhz5uEDuU=;
	b=CAhrk361GRCTMN5C9xmFoAsRuiJrQwpqR8waECAuh+6u+ihcQr1jIZlGgUYVRCdq6asK
	 R0NRYJ9ZP/EU/o0bjVHVT+EAxpj4fY4mPD0snNsDGXYV7BXbn8B0wKpNz9A03iz07prlb
	 8RoOriBsQrEpbkAi6TaQ/9RWO6L/Qhxsh2zkHCk/OybAG4dxFWFE7nxMKZtlxw/8jQXB9
	 Shn7UDGL4u36/fLFy+msbCJPYEyciOATSRSqcswY7IKDt0/kWLoUGU777t718u2U3P4nY
	 UZiuhLNv4RICxmhXeL5GNMqQLqG8IvNDSBDYN3KQL0kj7U8tKD1dRJxtGIxxs9JS8OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SWGW9WvI;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA19E606A31A
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 15:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA19E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SWGW9WvI
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so3446615e9.3
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 08:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792943100; x=1793547900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0vgeH4sze1VHMGmMqh9MlIMZCyUAgrFNnWhz5uEDuU=;
        b=SWGW9WvIKg2fivf5djPJlrcId8el4e90hbdb2siEaeMVDX4v8OexjV2Z45JrtvjaX0
         r5uDHqvYAavBQzOyF/8jLVi0yIhpuxv2V4D04g6SccviZbairPg2ggxVpTjkESrn0LES
         FcQaHshGGvdPV1XcdO8ENrVXD5yfZlxrDiFC/1w6Rquswu66nyEjjgN3Veeib3oYpDDx
         bCBFy82Tb8oR2D56mJZtQVvPkHOT6RfqgnxWkncsjKA3XVIF7Fim0vp2rgPJwyvdyp6s
         WX7AaGiFSYYxf+bKC4V0/Xa9W8xHbsRGqTtfiZLnRoSIbmAuZJCOJPnY6pn8A51q8kKM
         Bz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792943100; x=1793547900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0vgeH4sze1VHMGmMqh9MlIMZCyUAgrFNnWhz5uEDuU=;
        b=rTw8nJMDrsDSZDNALGysx6qXAavmwiiWXEwyPDhS7jEfs13OCsLogv2X4RE7LyL0N7
         wS4HQ8a860Xj7vihl8/+yGQM6VhZL9H2ITgpHrJbhPSSWcIiTCf3oWe7mN/7GH5DjVXN
         KMrikUmvqQP+souFr8lzCb4Ms+lSWjc+G0Mej2ocyB+rmQMyqLDgnTUOLTuizcs9yN5b
         IOHBkF98mrjgVEj//R6ISQdOwVJMPVigKdPrH9kwgzBuFo3b/q8gVypj6Ihkc8A328+C
         Yivkmarj4K/8fBoamU5X4mUiSQ5lTIVY+70XiM5+8LHoq7GVEQhpZW81NxZWrNbCt20y
         K4ew==
X-Forwarded-Encrypted: i=1; AKwUvBxkVGyzZ/L8mf/siNV7iRGCkCB+mqqQ5/ubDeANuQEI/tj5bQr3VvA4UbJVsv/nrrE2N766EifnJXDo3Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5NsFh3CaJ1UCjv3E1koZ5XCxqeSSGqgwos1X8vFG7GzKusKXz
	l59svmrLA2On5nc0OHNhd/RG4eRpr++wOg/7nz+Ew06VW8quohQXbmJz
X-Gm-Gg: AYBFou2wse3QB778F09nmnxQNYlHxrD6Xr8bbV0SR5ayWPcSogA3AXv+JFOnZYR+kks
	YDyt6DkkcxTRfRd7HQSOm6+dkw4JbSQVZTrLAVUiJBfnrEyRoftfwaRwbWJ/65woIjVlOgwz7Bi
	hVcLCF+bYGBmJnGtodt/D1WPY3Kk+31kUZICRSfSegxjlL90OphP3s/HotSeQxK7JEKxMI0EBbw
	STwbICnCBeT48rx6d/wxrKXomfsBBbT/AHgL20vi/IsBRdo+VGB+v+UPAX9XFV/1gbkpnsRM+T2
	0igaxIqJJPK+jdGFCK61FoRDzsQVNKu8PbmKYZpcoUuPqabtXyIolXmfPZqItyaMMkh550jqQzH
	wUMwR+3X0OGHSFlppGGsszw9gtm5OeWsSpRfMyXOK2zWoYGx8M7wCD2rLDbxYNxZXoVqd/tJ02W
	uVoyNfyx0NasyvpDTAirsVW5v6dIJS1uHJafHJXrVqLK25flbMag0eXiFnM3d/ENFJeVFD0lfdP
	q0so67hsoVStfkOLoZ+3nc9/At2pG+Hjrs4BM8zUDXttopzENdT/I5e1VM7DvojDxHZ9sFylpDV
	Zsk9PODm4yBP2Q==
X-Received: by 2002:a05:600c:c173:b0:4a2:883:4adb with SMTP id 5b1f17b1804b1-4a35ac9ea4amr71754855e9.22.1792943100278;
        Sun, 25 Oct 2026 08:45:00 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e11bsm157355105e9.1.2026.10.25.08.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:44:59 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: ipu-bridge: don't reference the module image from software nodes
Date: Sun, 25 Oct 2026 15:44:55 +0000
Message-ID: <20261025154457.36770-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010155626.2766298-2-dmanresa@gmail.com>
References: <20261010155626.2766298-1-dmanresa@gmail.com> <20261010155626.2766298-2-dmanresa@gmail.com>
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

Hi,

You said the Surface Pro 7+ is leaving your hands, so here is a run on
other hardware: a Surface Pro 9, IPU6 Alder Lake-P (8086:465d), with
three sensors on the bridge (OVTI5693, OVTID858, SMO55F0).

To be clear, both of the failures you fixed need the IPU driver
unloaded, by module unload or by PCI remove and rescan, and I cannot do
that on this machine. A warm reload of intel-ipu6 leaves its CSE
firmware refusing authentication, and the cameras stay dead until a cold
boot. So this is a no-regression run of the normal paths, not a
reproduction of the bug.

What I ran: your v4 1/2 and 2/2 on the 6.19-based tree this machine
boots, on top of a20c843c9bc4 ("media: ipu-bridge: Keep the
clock-noncontinuous property name out of rodata"), which your 1/2 builds
on. Both applied with offsets only. 1/2 changes struct ipu_sensor, so I
rebuilt intel-ipu6 against the new header as well. intel-ipu6-isys was
not rebuilt, and all 24 symbols it imports still match.

After a cold boot:

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI5693:00
  intel-ipu6 0000:00:05.0: Found supported sensor OVTID858:00
  intel-ipu6 0000:00:05.0: Found supported sensor SMO55F0:00
  intel-ipu6 0000:00:05.0: Connected 3 cameras

The two sensors whose drivers parse link-frequencies from the endpoint
get it from the per-sensor copy:

  ov5693   419200000
  vd55g    396000000

(ov13858 never parses the property; it reports its own menu, 540000000.)
Unbinding and rebinding those two sensor drivers, three times in all,
parses the same nodes again, and the values come back intact each time.
The front sensor needs clock-noncontinuous on this machine (without it,
it delivers no frames), and it streams at 28.63 fps, so the per-sensor
property names reach it too. Rear 29.94 fps, unchanged. No warnings in
the log from the bridge.

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IPU6 (8086:465d); boot and sensor rebind, not unload or rescan

I have not put a tag on 2/2. Its new path only runs when the IPU node is
already registered at init, which never happens on a normal boot, so
nothing I could run here reaches it.

Fernando
