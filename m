Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEC635C1AD
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875669; cv=none; b=rJTEckZZkW9QTc5oitQpYstyxBpgYwkrL5xub8uMXz+kyXsVxuL611e7dHBrjr1gV9MpbiRN4BP2Ni3iwsh2HBZJ9EzKiQRKSljEVjqSCU9b3qKvqhwcc9nqVpsOdmT71v03Y4Y5pRUCOxn8pa3RLR0Ex+r8tzLdNVAeSizm7cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875669; c=relaxed/simple;
	bh=mHUP2EMa4HLrfBY6PoqklysfLqNsm4NlzRpAT2qHoM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wb09TqruYP2m/uQw7PCXk0BojZ1mzkwipfa/Z/eKu3APypTum6GH2mzOgmmae1P7v8ls7mQEbJwwXWs3IPHHyY7Uqyv2NNCwlE0WzVxcqWRnWvKeDDU0iPqDJLIxf1uz1RV3AEANatqexRnaeuMeI3BIBnL7xIY7AbTOO7jzN7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbS5f8Tm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbS5f8Tm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso6637945e9.0
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790875666; x=1791480466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mHUP2EMa4HLrfBY6PoqklysfLqNsm4NlzRpAT2qHoM8=;
        b=gbS5f8TmdxP/uhaCD+Jso5ydNkVCY35nEIJVwLatFyVzGq0L+N3BetlemWIwHkGdI8
         e6tpYk+BnYqkqT0h6ZWjusOZ8Zl9F4SDTz+B2n3X0HjcXolNKHzQqhT84xh01iqI5O32
         TkG+Vly6Z+Grup55UPITt/DFrZkgM8DMzy1AO7H7fy4eXpd3pS8IIICAXeWuyklCmW9Q
         u/d2tGd1yuJuyxRP5jMTuFWmO5QiBsarCvCNin4ESV7X6FiUXki+9RcQC3stJk+aDSEr
         h25vce6uBbzcSJNpxvxXXjEl+7TisCG7Qqwc2Cn7uYonvYzDPG5p0bd7iQ/PpjfHh10R
         p+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790875666; x=1791480466;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHUP2EMa4HLrfBY6PoqklysfLqNsm4NlzRpAT2qHoM8=;
        b=REJo9n0rUQTHAy6dPBJTjIoQC0ov0vVyjdoAj2MULtc3hFCxbwxGMd/Fpwm41iixjr
         FpTVoMKFMgSKOlp1ybU8wMPZIxSlmsUgeLXJ2c+8JDjf/QMshHrBR2ZoUe9kjJ+CwL2h
         xZjbzdSoC9BfQgl2qmEJaDJ+ohr76UyvCR+HoEYdyNrZOZKyGisNgEfiyG6HZ8/6au6p
         1RK4n8LgA2RsRu0MgHkj0MjO6GV7r3ZrS6F0JKEsIm076EByAd8z2U/avJNYI+Z9P6Hm
         AybO3jrKzsPyoc7lvEXX25vX2FPJy0M21IDpYmJUyCIja7HjUnZhZpvgswOsbWPdLHyo
         Rr+w==
X-Gm-Message-State: AFuF++ne5pHCmjtOvPXR1fUKUGfx5KUUrQic7QRO8kkYVAeAIdNXPGXX
	cJuvc9FgPoYpRHIDsB1nwJ9PS6z3uDmE6BFdarQROMaYrBy/AZX0b7rZ
X-Gm-Gg: AYBFou1iS3cgvmRNuRqUqBHL3IJ3zEyrUcBo1xhoJSXSc1kXcuI416JmhVtFAl8NfyW
	MqKBwV4PUnXLdc9ZIA+A9P3YR2B1UeX/NqYE0zMLZTLpMoNE65pfQr/v8H3xZouf2cuHYpWuq3L
	zMNR8803uhQgmKdCse8uHLxURpx3Kw68ZWx2irfZLM7ir5VHF9rfl9xF1idppFd16tpUnNYusaQ
	si4OzGXD2Y2RcRA9ByxCCAV+QR7fmdybOCVzoKmpMLqg86gZcS5KLxC7qebe6QzSdHguZfrK+QH
	ozeK5jtfcf9LcBDkeh3qJaxNNci9P7Zxfzx1QPjkW4SvBv1LTwZoLK9t3edrhmiYzllmypusWjh
	L01EH7NRt4X9wB9Ao4N+zi9Pp0VQujhhvSnfT1z8RBOzwvdp1TQYuIqZDj5/JYtfZSu064vfNZm
	BKwY8zPTzqWT1ig8YKuqQn4u8qAhkZ3hjoah4lBUQuWradZaDIrmRdQ9cGRIdiTmn/avC6lTyBv
	AouIG/KAnEwHDATW9raTZ26CmQah1FKTcwkoE2Nv1L6nEhOMAlqW42zJ3Ts2/ta40kb4U86KObM
	EEnBSXbD3VuwuXRmU6BteRBFBIwQhwgxyihGJ+3B5LclQx+eqZMGfP+dRKjs44YlN+k5XOc+goW
	EaV0i6sNX0ga6gpndZJLY80GOr0G3aaGESKGBUTK1
X-Received: by 2002:a05:600c:3b01:b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a027573634mr5070995e9.25.1790875665814;
        Thu, 01 Oct 2026 10:27:45 -0700 (PDT)
Received: from [127.0.1.1] (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691cdb3sm7131028f8f.25.2026.10.01.10.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:27:44 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
 antti.laakso@linux.intel.com, linux-kernel@vger.kernel.org, nicfio@gmail.com
Subject: Re: [PATCH v2 0/3] media: Two oopses and a hang when unbinding a
 streaming sensor
Date: Thu, 01 Oct 2026 19:27:42 +0200
Message-ID: <179087566277.2226896.14093541499965645@gmail.com>
In-Reply-To: <178921203630.98144.13238972861597227362@gmail.com>
References: <20260911194854.78894-1-nicfio@gmail.com>
 <aqUoLr0JFGEBiJIf@kekkonen.localdomain>
 <178921203630.98144.13238972861597227362@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 18 September you mentioned you would reply to the framework patch
(2/3 of this series) separately. Before you spend time on it: I have
reworked it, and I would rather you look at the new version than at
this one.

The v2 patch only checked the two pointers in subdev_open(), which
narrows the race but does not close it. The rework stops reading the
sub-device's registration state in the file operations altogether and
uses the node's own vdev->v4l2_dev, which unregistration never clears.
Reading the code further, the same sd->v4l2_dev dereference is also in
the EXT_CTRLS ioctls, so it is now a two-patch series touching only
v4l2-subdev.c.

I tested it in QEMU with KASAN and vimc, unbinding and rebinding vimc
in a loop while 16 threads open the sub-device nodes or issue EXT_CTRLS
ioctls. On media next every run oopsed in subdev_open(); with the first
patch only, every EXT_CTRLS run oopsed in subdev_do_ioctl(); with both,
there was no oops or KASAN report at all. It does not address the
lifetime limitation you described on v2, and the commit messages say
so.

Shall I post it as v3, or would you prefer to comment on the v2 patch
first?

Thanks,
Nicola
