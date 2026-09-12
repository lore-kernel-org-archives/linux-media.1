Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550EE242D65
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 11:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212041; cv=none; b=l7sr/OgYAMEk0AlVLuyShz8L5WUB0hZnakcnRXawbzhCZY77tcbkG1K4x6C92mtw/0WKvJoBN3uhcs6AR8Cl265vdsNW4W65k61eW5ClqCtegdoTB+mIeJz+7pBz/4id/1jtoOZwmJLOWu0UZVV2BHEN2d8d3pAvr+1emJFBc4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212041; c=relaxed/simple;
	bh=uz+8o+4CIHiF/v/+wDvIWAodk03cAE6xyHUGgeY/rSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PQNyl76qOr2xAj8JEUDNBZCpJngrN8rmHoenahm1QMMq24209ab8ybmf163eFE6PjHbb9B+d4ijcmtuLd9+ObXI3UghAclvbGzxObvE6olEHOkxrvEbLkRu07XNP6XBl5xFQlAWYkLf7par6jX11PEVoWhenwa4gTlVapk/RPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYKMperG; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYKMperG"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so206962f8f.1
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 04:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789212038; x=1789816838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=seLmMH8w1jJOA6VJ/PN+TysiPYG2r3ONYQCf9mwCHSA=;
        b=AYKMperG74CdZ4v812hugEc9vFGV54PUUMxBRsvHYa4ALWBIn/ISZLNKZc4L+J6D0r
         N95nIpgb3hjUSJ5RBO+oEqxy6/ol6FudbkjqXZxfHXweb+fiumKQiZ27/2bJ17bAxM6a
         DvApRh0EQhi99HBgpi+WSHYbJUnUIXCGnYc00dyS/NIxpJ5j0TwRTsgGLim6eANDi1iE
         iY1pb5rEggW8wBcdoI6nUwk5oFUDBauiQXKfR74L46xEUAD1ZqWrd0cI4CcaD8GllwO+
         NCZ7Yi19Cb7JkJQjy1L4P9ThlausxK5cV3rWeSvCqIj0N4RUJ6/MGH7kp1nrFillvvLs
         kTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789212038; x=1789816838;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seLmMH8w1jJOA6VJ/PN+TysiPYG2r3ONYQCf9mwCHSA=;
        b=WlXc/yGKk5HbifrcEnhAP5c5LAAInkkkOXXD8Mqa/K3DFug+bKvFcB+sIZO8CcBx2W
         gU3JpkFi4I6xffeMXGHBwzQYYYNCz1Mw4sJ8YQn2KxMmjx+IoNa+tzzMhwQRtV/HapJ8
         5Q1VWte/wGzTFkbehKOkkiwL1hOT4KYT8hzz/omBl3LUyAs6xV0qdww90d3FbKooLWXN
         0fkLpezE77Y93gm9+g4LQTb/1+O0YbzYr+/ix1uKV3rvOym/6zkKo+L6C9ApR0Fu/15n
         RXUQPW08mCYK/w+QLHYHINWbA14x+fRm+sTmkSV0WiZVdqJMUZVvahunQbrFQ21xd27w
         O09g==
X-Gm-Message-State: AFuF++lOUbbYDrl+hDTxmhbLWL1Ut+grb07rcWdD4IkG7gpOhbgCGmC+
	J+3L1bW+Aiy5tkG/g0Ws7Dr/Nw4mp0EEO4ULdj38pvfHYkDFp/d4j07p
X-Gm-Gg: AYBFou3skr5H90bbSUa4xWPqUNADMV3YtFkUdhtnnIYRmNtIBqION4L0YYtvYHRi0/k
	Dxn8YmyJymmzewxK8C0PE5Z0F20YQCJjojtRYFoYzBUitbe1eisbLRfAjzt2nNY5ghr9QUgxMER
	ZPIdz+S1VhERGRublE4y3QlpWhy5GlY95/6h5M9GqSdQ6aF2WKk0qVFJ5FHsQURpVZ8yq7mp6SL
	RkUxHSTOPMr5hn5Elbi51bhHOhv6y4jue5saVMOpXDgLE88o6VuYJSnfNYyiGvsc5b6bsXJM0cv
	aIBQILzIHjr2oXO3AMlRgxT81Uuy+W7P68LyfsPQx8++wXz0eHLQ8WHKJm1jDpWHkkn/AoXow9g
	TBp9HHzgSrv08bXy3O0umD+fbkQ4393hyXUZ/OrtRZaLr4Tj+k1ZBTh8l5JKP0GuGbFbUDt+rVL
	R+vPnOZnMpzpglsLBmlku63qHQs6FKwgdzT5jb5C+Xbtg7lAJN5gADh4XJfRxAkyUhSVtQ+ndEc
	bL9hZsvTxn1xv/G21ARw35NB/QLUwZ5PjKdPqiRWELcToRxa71U6RompnvEwfHwvQweFxbdBorM
	TNveA4IQCiUCGHr2LJwj4gUorpq8VuboqbkML+N1ux4k/w4EWi/T/k9zz4w6cYngSX63ThkWwp4
	wI68duevwFD7bgckaMjRgvLZjJ7AlkKy+aCc=
X-Received: by 2002:a05:6000:5c8:b0:486:e935:59b with SMTP id ffacd0b85a97d-486f6be9488mr2277654f8f.17.1789212038287;
        Sat, 12 Sep 2026 04:20:38 -0700 (PDT)
Received: from [127.0.1.1] (host-95-246-9-241.retail.telecomitalia.it. [95.246.9.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm12489438f8f.32.2026.09.12.04.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 04:20:37 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
 antti.laakso@linux.intel.com, linux-kernel@vger.kernel.org, nicfio@gmail.com
Subject: Re: [PATCH v2 0/3] media: Two oopses and a hang when unbinding a
 streaming sensor
Date: Sat, 12 Sep 2026 13:20:36 +0200
Message-ID: <178921203630.98144.13238972861597227362@gmail.com>
In-Reply-To: <aqUoLr0JFGEBiJIf@kekkonen.localdomain>
References: <20260911194854.78894-1-nicfio@gmail.com>
 <aqUoLr0JFGEBiJIf@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Sakari,

On Sat, Sep 12, 2026 at 01:23:42PM +0300, Sakari Ailus wrote:
> Thanks for the patchset. These are known issues and unfortunately unbinding
> drivers while streaming isn't supported on MC-enabled drivers currently.
> This is a MC/V4L2 framework limitation and cannot be meaningfully worked
> around in drivers.

Understood, and I won't argue the point for 1/3 and 3/3: both are IPU6
driver changes for exactly the unsupported scenario you describe. I'll
drop them.

Could I ask you to look at 2/3 on its own, though? I believe it is a
different bug, and the cover letter framed it badly -- that is my fault.

2/3 is not a driver change and does not involve streaming at all. It is a
NULL dereference in subdev_open() in the framework itself, caused by the
ordering inside v4l2_device_unregister_subdev():

	sd->v4l2_dev = NULL;
	/* ... */
	media_device_unregister_entity(&sd->entity);
	/* clears sd->entity.graph_obj.mdev via media_gobj_destroy() */
	/* ... */
	video_unregister_device(sd->devnode);	/* the node goes away last */

Because the device node is removed last, there is a window in which
/dev/v4l-subdevN can still be opened while both sd->v4l2_dev and
sd->entity.graph_obj.mdev are already NULL. subdev_open() then runs

	if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev)

on those pointers and oopses.

No capture has to be running for this, and it is not specific to IPU6:
any sub-device with a device node can hit it on any removal path --
unbind, module unload, or a hot-removed PCI/USB device. Unbinding during
streaming is simply how I ran into it.

If you would rather have it resent on its own, with a cover letter that
doesn't mention unbinding a streaming sensor, I'm happy to do that
instead.

Thanks for taking the time to look.

-- 
Nicola Fiorillo
