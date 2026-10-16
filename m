Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994C14749F4
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163114; cv=none; b=GUb045PASSPZpytF3XVmTDOUheP+rzsi/6KCKNhCuib9UxF8GFyB78tn/gn2Fnmz3NIx8XODgn0FHGoVktHjehfb8SZb5Ilbz7p2C5AE5ZJq5IhJ3wmSUjWdevtERCzP6JWF4fFll/kNpkWmYDz+wMbEYL8nFX5Rq3h+QNCxTUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163114; c=relaxed/simple;
	bh=+ZLwGfcTnuWOjkXmHzANGbisqtehi9ORf1DFvCUB1/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sPVxW7tG2kWXeYNBYunbcoQKGFFjiFRj/Bc9lo8AO8dsWiIfJdXrGjdEZs9iykIq9HAMq9Kt2G3HlUSHOStPB56olDqrgLFvbSEy+j3UNr5lQQC2IiF1j2Vfy3ZFW7MspQGJEDz8+J3/RkTn6SIXXNg4nsydo6mCjomggbDXLCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWtL6RTr; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWtL6RTr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so55878a91.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792163113; x=1792767913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZLwGfcTnuWOjkXmHzANGbisqtehi9ORf1DFvCUB1/g=;
        b=SWtL6RTr9xNINcj3EH8LYvLmkQ1FlDwZMAYn5FK22JnqYlZVe+Uifg1BGdPWeV5wOn
         s9yTDNk/JbIqUoZdyCeWUCp79u3ZhWbeuVRUDD2UEjCveuQyS3VQaHKBoI2/ZvzhOWAl
         ihAjaj9gUVgJBWqKDhXre8QLAjQdclK0mjiu16/F/BlzWfULIjsMkrqcju5uoTBf9Nzi
         8VlxtTKWX7WX+BwL1Yel1DUk0gILPmr3w9OIAiST4HIF+ACYVnlgzYOzwAcO2Arms3n0
         BoCAwPn1Ikg5Myv/gLBHqsYRcMzycIfvdMTpSBvxC9ZMDEtG/QnUE3sLoMoOLyRbLyhw
         MFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163113; x=1792767913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZLwGfcTnuWOjkXmHzANGbisqtehi9ORf1DFvCUB1/g=;
        b=HMoIpax2ZiRMrmn8CUvXlPox2QyPGpnQtv+zn1FjSYm1O+WyYa9gVkG6DeTJNzRq50
         OJq6UX5WM8XYS9qq4nZjLEOd8S6Ctg+Xyn1dS9u1tGKeQpL6yIaoAs0e3/njFD94XH1N
         4YBYdiHGJuHHkj209RSLIjv0LxnosWsOO9Lvkd8T56ncbUn3t+4SOv80Q4371MS+Ng2o
         yCBcYUXkM2F9k6Uh0SKCui9+/1FhdadVS00EraXaSQZFDuxpqqTvLHoVM0R/aoiUsrra
         O7lQO3ptw3/6wslK4mIsG+nJ14JsN/zFlv0jpbS0L3QHRsohneYs0f7vVLUoGINWU/F/
         ZtDA==
X-Forwarded-Encrypted: i=1; AKwUvBzj/bmWY6kig2BZw1Zt24QUvNoUjWXW5FNdT0BvKCNvmUkttgEseZkfr5huVZ7+5AZFAl4GeBGRO137Ig==@vger.kernel.org
X-Gm-Message-State: AFq9FYLb1ZQhnUUeryniWxhJi+pHSE4uPaYiCJhIlgXOUzqFsUf8uUaS
	NNOOPLWF4Zjlr7YEN6pLv1b9eOcv5TVSFtOftp7r3Ej6PsuSwbqK7jNL
X-Gm-Gg: AYBFou1Resia1s4qFf88OE7CkKLkNooaYoEF5GEXQrSYnX4OFwtgK127uHgyNReH07g
	PlkuMPcY88ifIU7zRDTpRzQ77f8vyDEFRN95rrZeGnVWYxSj6NE2gp9tsO+p33HTw7QKruyQVDN
	9NM585TJNnlbtv4UfXr3RZuXPBpp2anAloGw5n38gEe69xtJ+y+Rs90tz4DwwO1/plzhgqNDH8c
	iTIr3yuwq0UPmh+QIPmssjt/D6p0GGvmiMkuOlTZMdThp2zCelQe2b/4mSe/r8xOc3kccEqOTcF
	kGXdRgsyTju7uay1syxqgPVWF3GrpCCZrfAIsf+YMTUaNOKfuQJFzMUWpl/cJ80UVHAOoHnc8HL
	GtGgUQpUUtXzNPjFeIKPzJSeUM1ajfi7zrDM0wQow7Y1BT4hGuBGl2MV3X2ukkFkYJik93gX+Eu
	WnTiGoQiFfxElHXXMjmzJguGYnkxXTTuFfljj+Zx8aSBJNJOgfUzCLdHfT1S4BAba0uarqzZ+cZ
	o+/oARxIA3x+8g2/NqVc+TItUAaURngaPWbPnyCSVLfiNi/+nMWQe0yAHsBp1aN
X-Received: by 2002:a17:90b:3b8f:b0:3ac:acc9:8e38 with SMTP id 98e67ed59e1d1-3acef596050mr72223a91.66.1792163112603;
        Fri, 16 Oct 2026 08:05:12 -0700 (PDT)
Received: from Ghosty.python-cobia.ts.net ([2402:e280:210e:2e4:197a:43fe:563f:5948])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4991b8asm4527644a91.16.2026.10.16.08.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:05:11 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
To: Jake Steinman <j@metarealtyinc.ca>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eduard Kulyk <kulikeduard89@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] media: Add Himax HM1092 mono NIR sensor driver
Date: Fri, 16 Oct 2026 20:35:03 +0530
Message-ID: <20261016150503.3363284-1-rshouriesh@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013123220.17716-1-j@metarealtyinc.ca>
References: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com> <20261013123220.17716-1-j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Jake,

On Tue, Oct 13, 2026 at 08:32:20AM -0400, Jake Steinman wrote:
> The staging/ipu7 format patch mentioned in the cover letter is dropped
> and not needed. With the ipu6 driver from media/next the sensor streams
> Y10 648x368 at 180480000 on Panther Lake (IPU 7.5).

Thanks, I'll drop that paragraph from the cover letter in v8.

> On the crop: I would widen the crop bounds to the native 1296x736 array
> and keep the default at the 1280x720 active area.

Agreed. v8 will report the 1296x736 native array as CROP_BOUNDS and keep
CROP_DEFAULT on the 1280x720 active area, so the 19.2 MHz readout window
fits within the bounds. I'll wait a few more days for review of v7 before
sending it.

Thanks,
Ramshouriesh
