Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB61835C68A
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421842; cv=none; b=lg55xztOh/fhEzf+N0lIxTVfXOkmrNndTHFCOQMy8Qv2JRZrEoIyy54F2Ed9xGx8zQj65+wTdW1TEhsZ2kJ1rLk5k93H1fVmhJ6xiRKDWYLpr+4N8u9EQsOb6MS0ixRplYaaNXNZxhKA6HlbljQBW4Mxsxnl1s0oQVyAB+/x6rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421842; c=relaxed/simple;
	bh=dwFEAVcMuNbjpUaKwtHEGOUzopXQgA/Z+K4OSsyB1zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4K6YZGf43tB/pzMXoDChL6m3da3L7zsHrA13CXBOUyKty61AqkcPfcR2Vv38PXtXFWhLuxh13gRNsE4oa2BKYR4afj0oy6vkJD6M++a+SYlcF3ue/pivzoxOv/HbX3/hzVLgdDI5sMQx/mafpUsUQRxEtn2KzO57zbwnEwet2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXRGKv2m; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXRGKv2m"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf50c6f235so24686575ad.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 07:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785421840; x=1786026640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cnNEMWbzX+zx+wUadpPafeWf3mkrABzNMdn+bvnocmI=;
        b=iXRGKv2m2zCYH28x84CcoiZE5rNFFFwtF4bgtJgRVDFM3Rs1OjY9iBNpMnoXYdSpyf
         8MLEKsJLLYSDnYEvcAgaef9jgk1mOiw7JZ4b5NbyKCxs1shzWG12HYTo9MvcwDE/TjNU
         z7nSwsHpGrz8GMgp6KuFUw4p6kzT/vyhYmsGaRBDSZ/gc5dxNiB9Ri7zOR+IIpLkjavl
         fnxMgRqQyVbd9uxCOEZAwfIiExyFFpdiRldPzr11qM1HGSi91WUNJlog4HH8kn6h/2P0
         Hi/A53RN7SyJ6fhG/61J0A8OmpLben+ey7BScXf1e5Jx37k1MVavedBwjQG8kgWnfYAY
         cJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421840; x=1786026640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnNEMWbzX+zx+wUadpPafeWf3mkrABzNMdn+bvnocmI=;
        b=TRZVYUWh9u40yDz0+DMF9G0UuLNGnZtlWF5xWdQG7XGuu51V45T55R1pCXHXSJzNEL
         CKcsASCUa6serfoLBRLjp84jqxUTKdJ3uU+7DLsiBGxevz4k9LXCLJG53chy+NVdON97
         L+FWu8adQ7nOp7ZE5toi324Rj5v9NA4MPFdVLpHwhoZR57caEZ3fq/E1ZmDNcrLA1b80
         eft8m2nTHDjayh8KItdJD5E6ly5nDba8brfPoam9/x1v4m7mzkMZ5BxYiMqAkpD/txRw
         ppn26oyBbBTWNr2jtmgVw/wuFuC5ngrku9tsVDaT3UUuUc5m8YHylircz/gR6TpsGSzs
         YCYw==
X-Forwarded-Encrypted: i=1; AHgh+RqtXDi93QZnYXURJ3L195r/vS25b2T+EshG7Nis1R1KxerYcXycssGxGIxVu7GSkrp8Nwu/LGgUa7y/dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoSVPqAGkdfLPPJAUIXnK9uYA55SgbDUNdaYAW2SyjyuhMvCJp
	q/8lsqqfQvfs7z0DdXXFDMkW5JjeWacQp7FOTY7lNqNr83p1vxkrsJW1
X-Gm-Gg: AR+sD11VIY/ve/dWw5moLsWVed5kMNUDfXWTWJIizwWW84LFLGKnTi1Tptiqs3N29R8
	w5RGTRM1HiYngbyNR/rlWOqorp9iN5BC+kqd/tQoC3JsHtuHtsIsI8pmkgssJ9xDwXaGzTjM4e5
	UwmZWt99tlKH+h7vhlzb0Dwmr7beezl/pUOWo3UJD6GZjRkcvVwO8fRIp4rOQF3Ub8GpfNpv8t2
	COClaHero5vmJIPC2o9iiLwS/Sr0WCNZW61cHD2WQb8O2/1eL/3+cP/Md7tflq4rH7IGtYYjOjv
	IFXW7FPZ3Xr/ZokV8it5yhwE8Tmdr1RAQevlDZG6fd3Ljpj2UXDl+qE6YRBcms4SOcpcRq6vvwJ
	nt+34AzxmqyWaZQDOBcH9IhU0+dXP7YKI50wQKz4bHucGXYOnzEcYnQ7QCJjnJL+Yo/elRZD1FR
	Xhipij+BF6HhqGUrfkm2KwHHG9EYSKCB4oeSUIfXEFRngslj2inv/GO7tZTjMnkJbqacugGLMcY
	A==
X-Received: by 2002:a17:903:1aa3:b0:2ca:7131:cace with SMTP id d9443c01a7336-2d03ddc34fbmr6616765ad.31.1785421840153;
        Thu, 30 Jul 2026 07:30:40 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc6d70sm28210225ad.39.2026.07.30.07.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:30:39 -0700 (PDT)
Date: Thu, 30 Jul 2026 20:00:38 +0530
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: media: fix spelling errors
Message-ID: <amtgDnLKMaRQg-Nb@acer-nitro-anv15-41>
References: <20260728145252.9326-1-shaikhkamal2012@gmail.com>
 <amjk-tq0xFMQSKog@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amjk-tq0xFMQSKog@kekkonen.localdomain>

On Tue, Jul 28, 2026 at 08:20:58PM +0300, Sakari Ailus wrote:
> Hi Shaikh,
> 
> On Tue, Jul 28, 2026 at 08:22:52PM +0530, Shaikh Kamaluddin wrote:
> > Fix two spelling errors reported by codespell: a misspelling of
> > "there" in vidioc-subdev-g-routing.rst and a misspelling of
> > "struct" in legacy_dvb_video.rst.
> > 
> > No functional change.
> > 
> > Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
> > ---
> > v2: - use Documentation: subject prefix (Sakari)
> >     - use full name in From/Signed-off-by (Sakari)
> >     - reword commit message so the media CI spell check doesn't
> >       trip on the typo being described
> > 
> >  Documentation/userspace-api/media/dvb/legacy_dvb_video.rst      | 2 +-
> >  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> > index b9fd5cadae24..71d044605315 100644
> > --- a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> > +++ b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> > @@ -344,7 +344,7 @@ Variables
> >  
> >      -  ..
> >  
> > -       -  :rspan:`5` ``stuct play``
> > +       -  :rspan:`5` ``struct play``
> >  
> >         -  :rspan:`4` ``__s32 speed``
> >  
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index 6f66ca38589e..164cf0ad3593 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -67,7 +67,7 @@ subdevice routing table. This may be smaller or larger than the value of
> >  drivers may adjust the requested routing table.
> >  
> >  The kernel can return a ``num_routes`` value larger than ``len_routes`` from
> > -both ioctls. This indicates thare are more routes in the routing table than fits
> > +both ioctls. This indicates there are more routes in the routing table than fits
> >  the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
> >  with the first ``len_routes`` entries of the subdevice routing table. This is
> >  not considered to be an error, and the ioctl call succeeds. If the applications
> > 
> > base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
> > prerequisite-patch-id: 912014811782d33538ddb17f00b64c15b364425e
> > prerequisite-patch-id: ccd9499245f9528a029f13653f6a670c70796caa
> > prerequisite-patch-id: dd62b9e9a5a590acea801e33ebcf110932d52a12
> > prerequisite-patch-id: 604c7b67fbc5678938599f8dfc11621e9d6e7bad
> > prerequisite-patch-id: 76849a9365b2ef77eae25f4ee42c11f124b1ea0d
> > prerequisite-patch-id: a0d7b90a4a5e251a58aa682ce414c7048eb47bc7
> > prerequisite-patch-id: 0208e7fa539736cc848ac91c09d7ca825b11d8f9
> > prerequisite-patch-id: 7b1377967ede9d22f77df0171f54207067158e71
> > prerequisite-patch-id: e39888d68322e429ea71d6ed6d49f4295fbbe14e
> > prerequisite-patch-id: 7f0dcaca727eb421484eabd62e791b96b3721874
> > prerequisite-patch-id: ff5dc6989d168666264e0eae2853f348a95d99b6
> > prerequisite-patch-id: 301b88e47a5d4cdc17e2152ebaf134b3f6685902
> 
> These dependencies appear to be unrelated to the patch. Can you send v3
> without these?
Hi Sakari,
Sorry for delay response.
I have removed these dependencies which are unrelated to the patch and
have sent the v3 [1]
[1] https://lore.kernel.org/all/20260730142126.11714-1-shaikhkamal2012@gmail.com/

Thanks,
Shaikh 
> 
> -- 
> Sakari Ailus
