Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B302A5293EB
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688384; cv=none; b=gjxncWBvXFkKD/cbiP+AMZ+/JIFlMBf+lKTi8/qyvcHHMC9Oq7XUBRiU45WfvzqR4oP6WvmezrCxuCvZ9u2VlFlgklV3U/hW/lA9SPxrpOZFgFDKzwYKVheqsKqh3ZITXdZwyG51Q5G+BWq0qKy/NmLmIEnbtxYV2vVefiCD99Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688384; c=relaxed/simple;
	bh=XYJ121tcwt8Pk1Ea6bO06cIMEmOF6Tdyk1jKVmV1gKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkSfiHHOOjj9GL7I6SXPk5ArO8hyDIt6vFRBe0lrUiGLILUUn+zkC/f0iZ6QAyxBkDIEHPh1DP89PG8CB2Vrkl9IK51Gw9LjKjc/NNmcelN1Q08LtlP6ZvDDBWt2H450GliwI/2ZBamd64tYb90CinCBK4aWICHHkM68hIg1nn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJx2ml2M; arc=none smtp.client-ip=74.125.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJx2ml2M"
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1438191eec.0
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790688382; x=1791293182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhyYRQHQ87I5M5mEOfyWjhfFcg5NiKnh4Prr6HH1V6Y=;
        b=VJx2ml2M5MLLT03X6MeyYhi7+NcPtYO2AA9TCsrl9gQg2d9AUfUwb3LnN+OJLCzp8Q
         zojc80/3Dkw0EWr4Z/nWVPU6uZAZ/O8UGOzIKD/yXPd6CQ5r6yPAUGWh7I9p6XZbdf8T
         WsKdAkffyp9Ca1uaA0iTLcxXnqxmo4Y+c5M+rDhL0sg1FlAn3ei15KnrJJdTrx9F0xSO
         G69hr8ScGM9sKe4/c7PSR6FqSeiZ18ns92tl6io4f1NNNVbKbLcsY5IZKIRaR8/veg3T
         X6rDlGVSGLfn5iE1L3HX/lVRKyAP5sPBW1VPyfo88a+T+8SruUAeByyijhVct+kfyrB/
         XpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688382; x=1791293182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhyYRQHQ87I5M5mEOfyWjhfFcg5NiKnh4Prr6HH1V6Y=;
        b=CoxUcLq9KXzjkTuzHjTCzU0zHpOFE+iCdHTwQpIcpdDn73LwBguHf3LjICiLE28yKc
         dp1lgn6+6TzUIR+aDK9a3uHHaWgJj9eFbG+Yv39n6wiETtM48bqgo3cErGVagj83N3Z4
         bt+dOgKxC4762HCFLmdH4UQVkmpoiwbdzECje7pChqKzZPCzn9MRX15uoKS+a/lmllXi
         RsE/jhBDUlMO4Y/wm7DkxdkvimNYg3FuBGl9S1LMqEyZVwI+OtOlu6gAafS/4VxFiyS1
         9zpPgX5uuTy76zywuBaT8vwxRuXOdh367ufYJcuteDG13ErMOvIB53fMKKGkBQOyBOEu
         2o4A==
X-Forwarded-Encrypted: i=1; AKwUvBw/grXSXPFF1k8oafGtHta+m5Zo/Og8Wd87nRvSIdJ3gckiZ9HAZZSpfkGtI5sJpOdJbxwPjywTS7BjXw==@vger.kernel.org
X-Gm-Message-State: AFuF++mdTZohEZON2wJrNCCqMA7mhP1tCUFXK6xFkDywpXJmi1TSl+J/
	mKIqRuuARCE5As+shxe7eNsq9KOQpGcUzURfJCKbgl3Y21w/+qFcsPpx2DlD/+yF5go=
X-Gm-Gg: AYBFou3Tkx5xORbteCNZD11QYNefu224AaKoRcgC50+GCtfd1MBaEQgAEaBkHykxeTA
	HizW72SPMsQjxXul1Si+6whn6Bh6rMjG5+CtrqnWBVtrTM4NNqaG4TwdeMVEw8jTSVGGm16D+p5
	PVRzUUM8/YVt9C1hAuvRtx4aTioV6KqZqMhdIG/Dh6jUqIYKPJ5nWNBHLcLqGYO0s3STaKBG48S
	Ycilz0dReNoYpG+LRezLPH08okBHBhfoevky+Y3qQIfzHxbe2fB++dUkggk6klbzij9HDoag5qE
	SWZx2nzfXtqOl5hag32NN2tO5ug1FNZE+kz9u18WJhggdY6mcNAHv4sVxpsmA5r6jX8uESXQbKu
	2ZeITjKgxnuDMGghV1M84ReUOiG7tZ2ax5Mi0x8LBKYXPzCiO9CQkNT7DolygZxDD4+pPTBmqJp
	J0rL4JJuJoiVRkKc4pLq7KKdDMWiHk1PQIwm/rsOwJNbwcb3Gh7orswM+5Q+DrX6eS3uMi5FRto
	ucvkCSs
X-Received: by 2002:a05:7301:4d0f:b0:34b:8832:8706 with SMTP id 5a478bee46e88-34b883287ebmr1521357eec.35.1790688366426;
        Tue, 29 Sep 2026 06:26:06 -0700 (PDT)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm36468431eec.19.2026.09.29.06.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:26:06 -0700 (PDT)
Date: Tue, 29 Sep 2026 21:25:39 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Ruslan Koreev <koreev.r@gmail.com>
Cc: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com, dan.scally@ideasonboard.com, mchehab@kernel.org, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, pm@petermarshall.ca
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Message-ID: <aru5-aq_sPUDy8dq@ThinkPad>
References: <arY2CULvwXGyVvH_@kekkonen.localdomain>
 <20260929092238.1765758-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929092238.1765758-1-koreev.r@gmail.com>

Hi Ruslan,

On Tue, Sep 29, 2026 at 12:22:38PM +0300, Ruslan Koreev wrote:

> I wasn't aware the ipu6 driver had grown IPU7 support, my base was
> 7.3-rc5. Tested now on next-20260924 with the ipu6 driver and patches
> 1-3, the vd55g1 one reworked as you suggested: the sensor probes,
> ipu-bridge connects both cameras, libcamera streams Y8 804x704 at 58 fps
> from the VD55G1, and Y10 and Y10P stream with plain V4L2. So this patch
> is not needed there; I'll drop it in v2.
> 
> Ruslan

I tested patches 1-3 from v1 on another ThinkPad X1 Carbon Gen 14
(21V8A028CD, Panther Lake, IPU7 PCI 8086:b05d) using the ipu6 driver on
next-20260928. I did not apply patch 4.

Patches 1-3 applied cleanly without local changes. The VD55G1
probes successfully, TBE20A1 is discovered by ipu-bridge, and the
media topology is established as:

  vd55g1 1-0010
    -> Intel IPU6 CSI2 2
    -> Intel IPU6 ISYS Capture 16
    -> /dev/video16

The sensor reports Y10_1X10/804x704, and /dev/video16 enumerates
GREY, Y10 and Y10P. Setting Y10 at 804x704 succeeds with:

  Bytes per Line : 1664
  Size Image     : 1173120

However, VIDIOC_STREAMON returns EPIPE for Y10, Y10P and GREY,
and no frames are captured.

Since you reported successful plain-V4L2 Y10/Y10P streaming on
next-20260924, could you share the exact media-ctl/v4l2-ctl commands
and any setup performed before STREAMON? I'd like to reproduce the
same sequence before looking for differences between the two
linux-next snapshots.

My test base before applying the series was:

  6375e61c01e93e35ee7acd336a689ac1fae4b509 (next-20260928)

Hardware: ThinkPad X1 Carbon Gen 14, 21V8A028CD
Kernel: 7.3.0-rc5-next-20260928-x1c14ir

Thanks,
Qiling Zhu
