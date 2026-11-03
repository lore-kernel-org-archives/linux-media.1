Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709396;
	b=qpOI7PP5taiI1aEuawM9o4f6KLxu0FKvIMgLz72HcwnC+tCbicqfegtxsR5Z6vKM2jJg
	 Dfmzvq0xoSgSQGZ0vnk7P3SUHmhk8gM6VKvzuanbKO2RrZm3K9bTRxvd9dY7aB7wC5gAR
	 4vqejhLpQiUOHrmORYsTNaQ15JG1XSOGLcLIO/WnCaaqrKwqBnvNVAK+D+UclHPRdAg9M
	 39ZJai/xr/ezj3gcT9ozuLsV0/3c25069ZMAYzJhHhpUo/onI0XNnvqeYrym3J4Ir2O52
	 +mx9e+u7PMqqc/U7bb6Kr4L7FbCssEaNKEjttEtUmgGIwUNSgD5c5jCLMIIrmfhAAjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709396;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=2lmoNeBPCPRgh31x4zD8JhfMtUpoElYdbF2bfe+OrjE=;
	b=SiOn9xdxz79dVNAQqvZ88qYwSpEvHr0m1Wbgvp0lxXKYdbNiyFvDxr3kelxnAqYqEopM
	 4Z0oVKKhLIjOh+tXn7SgxCTkqIb9Vpwpuz3e0Q5uFqjovM3CO3y0+03CI1LPidxs/nUYz
	 vHgMycCsFUJgILBQPBWm68qsYb5q5i+F55vc1PWFDC7PjguVo0vMrD9l1ndJ60CXQ+PQE
	 mtENDj8qef1Tmhtp/ex29pKpkIbziF9SJ8MgP/BZNa4OFiXGoPOkS/Da0Ik2l/oZnYrlR
	 6kXGHdnD0NSjh/7QQptCuBsMaDR28ChzrmlcMYdzaA7wiNOy+GCXfzV6esflhalvypQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=pjmt6bl4mra37bfrwy3attsr5q.protonmail2 header.b=DdWMsGL0;
	arc=none smtp.remote-ip=79.135.106.103
Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D2B606A326
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 12:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D2B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=pjmt6bl4mra37bfrwy3attsr5q.protonmail2 header.b=DdWMsGL0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=pjmt6bl4mra37bfrwy3attsr5q.protonmail2; t=1793709391;
	x=1793968591; bh=2lmoNeBPCPRgh31x4zD8JhfMtUpoElYdbF2bfe+OrjE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DdWMsGL0Omvs+QxFZbsroX3uu6luSIDX3VHlXpxWBORQUtnincV5l/YqoRSZjiF2q
	 1G2YOJ7GrGduM3+Ku+RkgaijhFyHpByzEJ9ejhacGFsls43Wn4FUSNHSopfP5dkgCv
	 BAFfVYY9xWdJs2D6a9HfPKntXP9hJQFMkI5RKQ2Ags/vhUk4BXc33cIVmuIABcVxB8
	 VEbaGUqWK3QJ3qEROY7OFpFLERe4qeJofao+CrnyGIJ3W9BPUVAf3u/WKCUtt/9iEe
	 8suoP7dHjw2FQJHRFvhbat+r29qrfsyYos7erN9pcqH/uHz/tab5nU4qbN2U5o7tyo
	 OnRWI4ptl07PA==
Date: Tue, 03 Nov 2026 12:36:26 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Antti Laakso <antti.laakso@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 00/12] media: ipu6: Add support for IPU4P hardware
Message-ID: <aDZJlXzfVn1R7UC47TgI2YbHkd7cFWAqFk62vFouazo-xyzLXPnqKoZ_fWP6DX2YrCNI5F0hmapeic6LiKHdlluFARAsH_MTybxQjkIov6E=@proton.me>
In-Reply-To: <auj3IU5FC2lejqa7@kekkonen.localdomain>
References: <2MQDQgaaKZ4HAu3U6zhMj_Muf_H8tsVGLh_CSXM_kxcTL51pE14U9-brGqLYwPPJfDXHog_jWWWOTgToPYLMVZN-KW80t9sDIlEw1uwg-FA=@proton.me> <auj3IU5FC2lejqa7@kekkonen.localdomain>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 7f9b785c6f4844dfb70ae868191289d55a9b6356
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Monday, November 2nd, 2026 at 9:48 PM, Sakari Ailus <sakari.ailus@linux.=
intel.com> wrote:

> Hi Ruslan,
>=20
> On Sat, Oct 31, 2026 at 12:18:19PM +0000, Ruslan Bay wrote:
> > This series adds IPU4P support to the upstream IPU6/IPU7 driver.
> > The IPU4 family includes IPU4 (Apollo Lake) and IPU4P (Ice Lake);
> > this series supports IPU4P only.
> >
> > Most of the groundwork was done by Antti Laakso in the IPU7 support
> > series [1]. I added the IPU4P-specific parts, using Intel's downstream
> > driver as a reference [2]. The code mostly generated using AI.
> >
> > Image capture was tested on a Surface Pro 7 (i5-1035G4) with
> > both the front OV5693 and rear OV8865 cameras. Test logs: [3]
> >
> > Thanks to the linux-surface community and the libcamera developers for
> > testing the downstream driver and sharing their findings.
>=20
> Please use git send-email to send further versions of the set if any --
> threading is broken in this version. No need to send a new version just f=
or
> that though.
>=20

Thank you for taking your personal time to review the series.

I'll address your feedback, send the updated series to the linux-surface pr=
oject for testing, and then post a non-RFC version upstream. I'll use git s=
end-email for the upstream posting to preserve the thread.

> --
> Kind regards,
>=20
> Sakari Ailus
> 
