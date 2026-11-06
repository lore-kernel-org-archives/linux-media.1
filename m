Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982646;
	b=w1lH3rWoOt/NoTzxhqBFDiGM9GaTlJDwo6j98WOBNLeQ6Ghxt++Pw9nszsSGR/Erex5V
	 s4EbsHoODtXnFtg35QlkWcto6ZEkDU5/QmcngJGrJ1lCmyljyDC+1+a0PzcjNXIJIkhwl
	 0/Bm8ThfJvCfXNKsHcls983IXTH3l6gCQ73liHiOy08IagzThGgRAozb9MARhCJDny7Hb
	 NIv/Wy/o9/9JfVotlBGzc3xKWN6WQVP5ChN4haamIvzuTqsQO6c6eIq6jRnawPPnsgrrK
	 KsdQl3wqiTNBsmGOpihgiWg7uA8pFsRm6fz1oEbAy5Ppn2HTrw9biLlfdqxWA8JWL5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pClt+8RrSvtX2NHVDObuAu/oe/EsgtEDX8It7UUmNKU=;
	b=HFhpUZNj4Sy0NLJE2edbNcy2A+tmv4Q/IUDaRcEvjwnPi54ShJs8TjfqtrFwM0ZJlEYy
	 BbHSTI41Ck/RPVWsvVDVEx3NV0BbcCkMv1/fKVb9l/snuPrMWSvenbSJl+xlDboNZJade
	 AGwN7tHtFSdd8txvWKddVUOVTt1O1eRxdOy6oVZGpD0seMnjDMQjHGYdykQLTmbC2SWc5
	 e81UDaYT8j6QvLG/fvNqn0Oqmv2yBzPQU0VOm6wxy74fhZz/G0cdjKyZ3dgG36/uOIMsl
	 ULF+QSrlz1qblW5XAp/feLh90+YjJ0tAAXeSKot811Pb1EvihB4dUBkgUU72YnNsZkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvE0ZdCm;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E01606A329
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 16:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E01606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvE0ZdCm
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b467581b98so6767615e9.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 08:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982644; x=1794587444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pClt+8RrSvtX2NHVDObuAu/oe/EsgtEDX8It7UUmNKU=;
        b=nvE0ZdCmgoNJr136sLWWE5IeaEsdBblRqdQ2yWLqLC0tIe7LXjla0kPIMmXaGssHup
         D0W7HOSoZmhIbrNYJaQYTgD7Hwi9onB2/2k73aqwF8u5gzBfb8rI2RVpSBw8AMiUII8X
         kQ7GSrPmPc/COrdGfoxGDnxP0dlY7QM2cNCeSYc04pU88xDjC/21zC1rMUXEKKWnHvaT
         8BSCSCSW0BFlZcsx+RnX1znVXo3xKCUHgE090XtR9VhCZnXJtmkN++66ZIOc485z1s3Q
         GUGWuCLOZM6PCwD/jCiXqisbzGkoGpg+iaumEUQ31I1M2UwF3/fTedS08mYj5MgDDja2
         CnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982644; x=1794587444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pClt+8RrSvtX2NHVDObuAu/oe/EsgtEDX8It7UUmNKU=;
        b=cfOzyn6bLRzONE2YRYi0QB6Bk5umE5M0/oW3AcQaDpqXuKLjq/loVgIuwPMFB3LHJs
         eyoIxraPlzT6uAGRZoeNHXfSDXs3+l6aNmcNIf2A9Xtb/BUtaNsivSGV3IvuecSaV0bD
         Nx0lu/fAaKX5Koet7+tblMwRHpljZg4dQ9/z7eNxq8JoWrBqAVRxJ3szATH8owaU04+h
         Vd6RxjcUiblOxJa3irUEXjGtK/sM9DbUuqe3C1IGqQor1Sg/SRiDXw7o4zsm/qRHJgtN
         /rhKZeHWpCpcfmCfhbCfrMCZ+D5RS/SHg1I5McOfzwDnIMAgYCNemJ+l/QLgGrCaIMQ0
         UOYg==
X-Forwarded-Encrypted: i=1; AKwUvBzrJxyKe82upggj8dmeuDu0K3Z6pHS61J+GaS57GclZd09t9KzyG2kafDAJBZW2soa0JbQzy98H+IEuVg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GIm78yE9gEDylYh492HvaI1irthj0TCpSByy4qFsMtM/P/1Q0
	+DUcvSWHjAhtmNCGBK+uLh8fHMcqGOzGne1fOB4i8as2ubBNUENc0O4I
X-Gm-Gg: AYBFou1i1s/oZMscVXSO75gQ8KBDwyRd+PLDAxyyvuknH//GzOfIUmOU74dO2zXsZBl
	9f/+muauTYThbBBqHWCO2QVhypwiLDIDEtyIGY55fG0wiwfHbCAh+rE2bWp6SpcoG3QuxIaYx9M
	O6hkdixgsf1mRd2p7vBT0cq5BCU4PV+UIEaTtPaGmBzCqUYjkc1sLaNFZLqoDkWzACakKT1LybG
	XuvFv+XTSI/NY+HSpXLnKqJEULD40qpFk/eUO+UKUNkWA1F6K/Kj5ICJy6pEGrkqdC0Bpp4uwwr
	NrhG8SWB18ZhpQZNrZJO9v1TcQNj+uJgvnL6pa8kTZbWLqyRyV+bUBogrj6CB7TPpui7wL7mUjA
	BQdoE2EqXfdwmgp9U4RjU88zsWPS7/vX/uHuOROhW27FbKL7FNHYrhe1xxex4GMBSYX4xEsBEzU
	2LaRk7QYjWzJj9Yrgr8Uq4yDvhadhlDJva31ZtmA1AG0oBcc5dLuvFWcakr4fMp3rbGgQAX8ylx
	BGxFbJuJ7242FMgVJODrqaYr2hU6eJZmvD4FPsdnU2UxwpmlrogC1TrgqshcKMNuItlEfOS8ttU
	Be9ZYWidadc9JYxYS/pqKxLVycihgSuDiyXKbxeQNxjQWSVoHz7e6MfhxC8YzjN9AA==
X-Received: by 2002:a05:600c:609b:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4b6ddee327bmr53351625e9.9.1793982643802;
        Fri, 06 Nov 2026 08:30:43 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([2a0c:5bc0:40:2e26:7abf:1a7a:f1e9:306d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e28cce1fsm83045475e9.15.2026.11.06.08.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:30:42 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Alain Cousinie <alain.cousinie@laposte.net>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Milan Zamazal <mzamazal@redhat.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Robert Mader <robert.mader@collabora.com>,
	libcamera-devel@lists.libcamera.org,
	linux-media@vger.kernel.org
Subject: Re: libcamera: pipeline: simple: Disable packed mono for VGA sensors on Intel IPU6/IPU7
Date: Fri,  6 Nov 2026 16:30:38 +0000
Message-ID: <20261106163039.18237-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5bb49b41-368c-4889-9f56-9a477e85694f@laposte.net>
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net> <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com> <20261101164311.GA3368923@killaraus.ideasonboard.com> <304e2a5a-f8d8-427d-84f5-b6f4498452df@laposte.net> <20261101195019.220940-1-fernandorimoli11@gmail.com> <6cfa9260-b48d-484e-9c88-b75feb0392f9@laposte.net> <20261105004652.147540-1-fernandorimoli11@gmail.com> <5bb49b41-368c-4889-9f56-9a477e85694f@laposte.net>
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

Hi Alain,

> As discussed, the 640x480 resolution in 10-bit packed format (R10_CSI2P / Y10_1X10)
> produces exactly 800 bytes per line (640 * 10 / 8). Since 800 is not a multiple of 64
> (800 / 64 = 12.5), the IPU6 ISYS DMA engine fails to align the burst transfers.

Thanks for the retest. It rules out the rate and link frequency, but
not the stride: on Alder Lake the same 800-byte lines with an 832-byte
stride stream and stop cleanly. Packed VGA stalls on your Meteor Lake
and works on Alder Lake, which points at the MTL ISYS driver or
firmware, as Sakari suggested.

> it validates your recent patch proposal to disable packed mono for VGA sensors on this platform.

I haven't proposed that. I argued against a libcamera rule, as it would
also drop formats that work, and I agree with Laurent and Sakari that
the fix belongs in the kernel.

Fernando
