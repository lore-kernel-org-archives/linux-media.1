Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013316;
	b=juWd7vB6Gz8tcse06lu4HzmWeV0aep09Na+V+7lGblo+Kz8vTqieOWPJrg7D3S9HrtE5
	 R/wu7gh0qnN93ONV2KYDcqYuZG9hA6YXBrbwgmSaJHGUPJT9x22B7huu4foZ7NQJlIoRa
	 8xzDZ5fxB0bOM86VQ+LVgzPQT8RneZLovgMQZvCtwjUiWRz301CWdLOoLKCgk4fd07dBU
	 ZX9Dh7JpnmILxhJdvgKatBbJ4F1qdMVLJ7XK9DPz8VJt/eoIFbOqgU1kZRYMycLm1HXmi
	 SNSBK/ys6fUpCWPb61r9fgh2gPQgC/cY16NzfULB/GpZaETr6ImuEvFKuCRUVGknqcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5x1hCgkbydzPy3+Bb7/xMpBTwiuhiZeF+iFtW3CiqaQ=;
	b=yfCdPey6TrLUEqbc9JY/SqtSILZcCtP1XkuYCPCKjDXtPqY5J95fkN0S0H67FoKAY442
	 P9r38r601gGw5tV8J3soScRNIEQus0IGvODgIclWRvadHXplmXPu0WhDjD/qV90XQGU3q
	 AgvC0DiLn/3natLvBOdrJXB5oXJmzeYgacIWzbx8huOon+te6gHx8jMpEP1YYkMTdrfGD
	 izjkELYIq6OalAubeWDucKL9dBeVz1BjBG+jRR62s0PQdvM6zLRmiOdF0vchmkBdyOw7f
	 Xva/49pzZMI+0XHAi0ewf2NZyBH0f40AirxtjGIpp4RqzjbKcHl/PpzSYxWiA4DOsXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SRGpRQFX;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE50606A32C
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 01:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE50606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SRGpRQFX
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso10213805e9.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 17:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013314; x=1794618114; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5x1hCgkbydzPy3+Bb7/xMpBTwiuhiZeF+iFtW3CiqaQ=;
        b=SRGpRQFXm9zSVjDFtdHcHKivvR/NJIMFHSj8T9ngAoMZQrUXmzTFswGbASyvcwHI23
         Pa0s/Rb3bCgVFKsn5zEurdsKn4h3ylQWA9heXFy5Mhs/OXHGPr3XUgMQ4JPldHz1fdlR
         AJ72wr23VPYe9Zpt8cNBlaifAs+/uWRclfYk0ItVXiIy67AqDv8elL4m1cPs3L8nZbbP
         VWaf23IYTZMqC6G6qYhOX5YXj8ocBMHn+ITPbYXjvtMbkrLU6GU7ykQW+SgG1NTKzOOV
         XwavTErgQel59OZ2gDYR2HQPeEWWZ7DRP5aaHUprc3U2aewBiVWRVMQmm+nm9g7Kz4PA
         Sm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013314; x=1794618114;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5x1hCgkbydzPy3+Bb7/xMpBTwiuhiZeF+iFtW3CiqaQ=;
        b=Rj6BD8TjEWojYDe0JfXpuYvtehgj6I0384E5Qw1MC7DOnLTSXbgVDIuCnZz/u4SMnt
         6XBACYYZctrhYUG675yQxsQYQoFx5pEruBOjTvNflhgoF9oryQ9RPZ8nkoRgabcBxw3X
         UE4wC3SiCl7kqgWpdXqMT3qrKDNosS4NAdFkQBSdi0SybGke2A3QJWgp3t/NUcvZ78xq
         8KVM2GJJRT7tnvr+2qTwb28Y4N6KPyf15gu/MeTWex/xThei5TGboIczs0KKqkbIhfgC
         ibC1m7sbrf+93hz+RQvx7Y+tjxfcIxTgRy9zNwwGVkABvOhel9bD872WfjurGM46fZ6k
         o9Wg==
X-Gm-Message-State: APuU4Z8W+3k67kgm+rvuOqtPgiuHUG1b71YMLGwCA7R9P07BdcqrmJH6
	r5zePVQpSy/CEM3yYoTG9KH1d66bMYl4ygmtUQWpGQBMxXwX35aZnz8/m7nmrLQIClXZBsytG1I
	DN8hZ
X-Gm-Gg: AYBFou0BwP5Ok7iWkce6cByYB9wMDHFz6sLX+2gmG0nefwXwsdrr17xbwuPxRkJdYz0
	l6b6b4OX0G6rirlFan9Qv0+kN04rwwfm0FpMB5FJYdNSfGtd0Fa1RBEuDbFdLpzGyY7SUVOBaAL
	+ZV+ouZrXOWclDSd99//bNk8IwqzzbpL/lwvsU1wYFbCLD2hzTlr+BCPOSssJ1HbYqw1fipFxNV
	GfNz7eQf6kx8NEpNJCG+lElDuwg+smMc70RIaCM7hJFT6jlvlDD1kCYR4CrwGumA0ltMTXCrSxn
	+brXBzAHrdQevM+f6sxTLNYW32t7JrjABF6K1ofPAVePDOdg9UkWjzpYFPG0rkQusBqR5PMgwJh
	q9cgQRVSoG48ihwmfMKksuOH2x/gRtZbPooQHjwuljoJQVcQqCKc/ofCR1p7BFlQxUMZJ2VizEF
	kGOwOJrx49huLDkeXNSssWSISLt73ooVYDUMDJUHUZ38oU2gzSXwD+uChx74XmwtimFzbpn0tpS
	a9gF66kplPuA0iiE9QPUGgjKfA8XI1G6UZXWtK77ahSZl5gzB4rKTeDwh30kKlpXwaE8NBwhLgD
	r/O26zbHHuD+TI6zgLAyTg==
X-Received: by 2002:a05:600c:154a:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4b6dfbac630mr72715075e9.20.1794013313976;
        Fri, 06 Nov 2026 17:01:53 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:01:53 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Subject: [PATCH v3 00/11] Add SOF sequence logic
Date: Sat, 07 Nov 2026 01:01:43 +0000
Message-Id: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auQrq0pA6XWlfcwLqAdoP4U02IjI
 dzdFhfGGJdv8s0zM/HoDHqyz2biMBhvBhuj2GRE9bXtkBodmwCDKmcgaSivQFtX35D6ySrKdNU
 2sqybCisSr+4OW/NcxePp3f7RnFGNiUmL3vhxcNP6MuRp918POWVUF0JK4Fwqvjtc0Fm8bgfXk
 cQH+ABR+AUgAsBVg1rUQkD7BSzL8gJKO8LgAgEAAA==
X-Change-ID: 20261029-v4l2-frame-sync-0d6fb94ab6e6
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5459; i=bod@kernel.org;
 h=from:subject:message-id; bh=HW+7M+gYjZKVNt79/g6HJ64pp0M5Oy6AG3eJDGTc9WA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh7mUqa5G2eGqvRmaVUmVTqE6en0LdSQrJQs
 aihRGZoZ/GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54ewAKCRAicTuzoY3I
 Oh86D/wJkk5uCftkyfmVBjvjzPLSwRBKiuc0+BhJMAoucD1vaPzY2kOdvDhWad6hlFCMkKLS5XK
 YebcDZJf+HbTVR6jUmpv9XuWmjhvqqYlWsUvPKrdQRH+IBuyD6o9t0Y7hCjYI+3L0u32S5gIqtJ
 r8EZKIjvjQUZLy6s8nIhC6GI5GGXKsWABTPfHN1Asvp61//oevifsG8TsVmps7osuyegj87AUPy
 CwHKf3iDkjsvICTQpsWceLVFluxEb4VZiTG5/pQSsTyVytB4vs7zkrFXv57MEnTkqtnI3lbXfUM
 0+0/zlIjf2fSxmP0juho1x4JLNwf5dokdGKxEoqWHK1Vf/cUtVa/Mvr3r5nVXgkYSJe2ARjAoNg
 TnrJVzeO8wg4IBuR1wGBbhRyFq6tOs8WFy4mK0cATrKJhGxDVrrhvMMFOX6d3mm8F12JcCkNwI0
 z7HkbiJPV11zeC7NpRqnSaWiu605deXTan0Aez3WvuoLDb+dr/6dPc6/3jdvMbVz03aoxp65icq
 eikpDGWrl4326fe48oFATrj3GG5d2DABIpwy0L8o6UOH55hQcUeE/koNbGukKgnZfE5btrK2nKy
 idYqjhBEb8VY006Z5wFUqSc10ZDjTVyt1FIsm7b1tPDHL1cdiUVgOp3G1noxv/HYP35KoTLujJ5
 6x2DWj6R8XOmzFQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

v3:
- Added CSID-340 patches from Loic wit permission - Loic
- Explains the initial -1. - Loic
- Drops the .id field enumeration - Gjorgji
- Accumulates RB as indicated.
- Link to v2: https://patch.msgid.link/20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org

v2:
- Amends series title to drop EOF
- Drops EOF inclusion until we actually use it for stats production seq_no - Gjorgji, bod
- Moves QoS into pm_runtime() callbacks - Loic
- Switches on vb.sequence change for every SoC the silicon enabling code
  supports - bod, Loic
- Link to v1: https://patch.msgid.link/20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org

v1:

This series enables SOF AND EOF event tracking making use of both events.
Whilst the code is actually very simple the functionality we want to build
off of that simple code is not.

- SOF
  Serves two functions. Firstly. Informing user-space of CSID SOF events.
  Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
  User-space wants to capture this trigger because it allows user-space to
  better align the time a frame begins to events elsewhere such as IMU
  event timestamps.

  That functionality is directly applicable in this series.

  However we will also build on the SOF event in later patches to allow us
  to begin programming of shadow-registers for the next camera frame.

  When the EOF event happens, we switch from one shadow bank to the next.
  This is only possible if you have the SOF event.

  So SOF serves the immediate purpose of timestamp alignment in user-space
  as well as the 'evil plan' to trigger off of it programming camera
  parameters for the next frame.

- EOF
  EOF even on its own is useful because it allows us to increment
  vb.sequence for each frame as per the spec not just when we have
  buffer-data.

There is another purpose to having an SOF and EOF event with sequence
numbers and that is.

User-space submits a parameters buffer. Kernel accepts that parameters
buffer but can make no guarantee about _when_ the entire buffer will be
applied.

So when kernel finishes application of the entire params sequence the
returned buffer contains the sequence number - from the EOF tracking which
informs user-space _which_ frame vb.sequence its given params buffer was
applied.

Similarly when kernel produces a statistics buffer that buffer will have a
sequence number - and that sequence number will align to the frame sequence
number that the statistics describe.

Thus SOF/EOF tracking is fundamental to passing parameters, returning
statistics to user-space and for the IPA algorithm in user-space to
understand which stats, params and frames are related.

The first patch in the series addresses a corner-case when a quiescent
system can take quite a while to wake from idle, too long in fact such that
the SOF event is effectively missed.

On 'normal' systems doing lots of things, this is not a problem we would
see however on my test X1-CRD system running from ramdisk - there's
basically nothing else happening and the wake-time becomes apparent.

This is not strictly speaking a bugfix since right now nothing in CAMSS
cares about SOF or EOF so if we take an additional 2.5 ms to process a
data-buffer on a fully quiescent system, that's not the end of the world.

OTOH as soon as you start to care about SOF/EOF then missing those events
is no bueno.

The CPU latency value chosen is 100% stolen from IPU7 which seems like a
good starting point - the stealing obviously - and happens to also work.

This series is really an enabling series for more work to come but even on
its own is an improvement on the current situation.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
Bryan O'Donoghue (9):
      media: qcom: camss: Introduce CPU latency QoS during streaming
      media: qcom: camss: Introduce SOF sequence tracking
      media: qcom: camss: Use SOF sequence tracking for vb.sequence
      media: qcom: camss: csid-gen3: Enable RDI SOF driving
      media: qcom: camss: csid-680: Enable RDI SOF tracking
      media: qcom: camss: csid-gen2: Enable RDI SOF tracking
      media: qcom: camss: Switch on frame_sync_en logic for csid-gen3.
      media: qcom: camss: Switch on frame_sync_en for x1e/x2e
      media: qcom: camss: Switch on frame_sync_en for csid-gen2

Loic Poulain (2):
      media: qcom: camss: csid-340: Enable RDI SOF tracking
      media: qcom: camss: Switch on frame_sync_en for csid-340

 drivers/media/platform/qcom/camss/camss-csid-340.c | 39 ++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 15 +++++
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 +++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 68 +++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     | 21 +++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  5 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
 drivers/media/platform/qcom/camss/camss.c          | 65 ++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |  2 +
 11 files changed, 265 insertions(+), 5 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261029-v4l2-frame-sync-0d6fb94ab6e6

Best regards,
--  
---
bod

