Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFF63EAC68
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659804; cv=none; b=cMNNdJ/muaCKtBVrHfPcUkboQ+r2JmD+yF6CKd+I1jZb7g/vZRKJ5lWaZoy1P7Cv8bGJU/Pozlh3yzX/szKFpZ0plIpiYEs7OrDadQOUUxXe3qLK3fo4S0BeEyY3BjYB1demC9fuu+VgMh9EruOjWRRtOlQIai60KFgW21A9yjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659804; c=relaxed/simple;
	bh=OFQ9g4YmqmcYV4IgtSRWbgsHc2tYbB9Crf6QRaEQy90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iq0fPtPLm28sGKh/ymfm+jgNT0/VSY/+eFLkGFjtHpXRLQcDgvVnCsj5RypydZPt3+Baf3HqkoT/ZLO7yWtsMpz2B8gZXwnP+t6ODmBQRMgsA3ZTFC75K4JPhwnf7wLnwfBId22yKPJCP7Br2wYOdUOAEVHVb57nUtkewmN8aOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqXqzm/l; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqXqzm/l"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so2605715e9.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 22:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790659801; x=1791264601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7BVOepdOfPEyiNSVVvqp0aGX28y7CZpdIoy1AiCbrI8=;
        b=BqXqzm/lZkusFhlRR3QChDI3QM2Knepo2ZlSXZnQFOnoMlTtVbkWZkIDKdj3OyzjHk
         Tb5HGPjfFI2NkE+4zeszqdGq21pNdjjpavfrM6HabiCqMEvzNSvJDXhIAHJki/l+aeig
         SnxrXiM70vtNBHaxOIoSIY+UVtWNBsdVnDLbDMFkvE0v31pYslMkkfIXfptEnKT431RY
         MT1RH3eWa2FiYeS8mnOQSuLVSXPIn7Buu6ULACCUXy/qTGOd5xTEcum0qSmB0QsKwwOV
         b8t6lUt9qkP16r0Z49YI+EUdzHOxczynZssX5dnNyIjfaTud8kE+m6pS5jefnFKEFDdG
         rETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790659801; x=1791264601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BVOepdOfPEyiNSVVvqp0aGX28y7CZpdIoy1AiCbrI8=;
        b=D6watodZFlTc3nFLhnUteSAUWwFQ/JporWdszuBtzpxjeXI7v03rDPapo+VydIu6pi
         q8kBPgh6fRcxhYTRSu+QJvEYmmM+Vu/cROi0mP8rMX24/GOb/qREclvlXrqwYSOdqLtw
         ir+uYVc1/+I92A3OhFAP0HSbmkYpDJ1gtFxE8yFNQJMS9hiCCX76LGf0/wkzkouXkiIb
         hD7tLfee1NabEmI478fePc2+B6Da7zP6Jfgurhc9YVLCphkwug8A14O14/qNpw/OgzjX
         iy4JpLFUx6xHzumPjWpA9sVUhmzKcQcK2bA3Q/spbLm+thsqzMCJGzEu9w91SldriWox
         KqTg==
X-Forwarded-Encrypted: i=1; AKwUvBw/ESFmmJyoBW0ddKN7Tz0LtDTAz7rZCKXWKmBi4nQe04xQXEWDUid5jaVAx0nFrrCUltCo21adUaee6w==@vger.kernel.org
X-Gm-Message-State: AFuF++lBj3P8y1dD9OYcZF6nxqE5OUHWezPzI/Qc2yZUzenICeKHsQ/A
	olBwZLW9cz7/16FuyCCsUE/idDQRwaFXoT2GT8u1hJu2GTwZAi0hc310
X-Gm-Gg: AYBFou0qC46kD4xpiI2973Xza7NCEPmBvIp95zG9tp8+9FkBRMXbpdkLhc57/yB2IKY
	1jylVzoeqMhCzcVphO7EweLJVquyh90BVhrXJPC7ktFBvKKHwJAtermDQzRR82QiM9Y2CVLgbTS
	awylXyrvXaocH7C3EKPZyfauO4lGp/ssDcZqg4ufQDQvKUE7oklL4gIB1ZCdCv/JlluOz9CBCY7
	nQQKrY3ma/eYwQs/l4SIdGKgjxhkfzaTS21UklgdijxCFZLvd/EswkMmG1bbvLmAEfq2iTozyNs
	j0mNv88mYQPefLna0bEHk+nk48/lEMLbJaKpJKngzbqSndojV/NEgrqrmtW14YuwCUjD4QGSRDf
	1sYlf+r1z+miXAIueu53oO8lSB01eMjXfbsLweJfIDrHE9Z3xOoZEb/cgQ5nmecKoa5/vnXMJLf
	Z5zKu5nD2QHM7KxbY26LQosOay0kTjsgjnl1h80d4lmG19LH+1som8dcoObt8r7ttVldqtC9mf7
	VNtIg==
X-Received: by 2002:a05:600c:3548:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a00d76700emr18743925e9.5.1790659800613;
        Mon, 28 Sep 2026 22:30:00 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm47614325e9.15.2026.09.28.22.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:29:59 -0700 (PDT)
Date: Tue, 29 Sep 2026 08:29:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in
 uvc_mapping_get_menu_value()
Message-ID: <artM1Kqi41JfNSGg@stanley.mountain>
References: <aq0siVcghDe6x9cs@stanley.mountain>
 <20260928203105.GJ4406@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928203105.GJ4406@killaraus.ideasonboard.com>

On Mon, Sep 28, 2026 at 11:31:05PM +0300, Laurent Pinchart wrote:
> On Fri, Sep 18, 2026 at 03:20:25PM +0300, Dan Carpenter wrote:
> > The "idx" value is a user controlled u32 so we have to bounds check it
> > before calling test_bit() to avoid reading beyond the end of the bitmap.
> > 
> > Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> What's the status of this patch ? The issue is a false positive, do you
> still think there's value in this redundant test ?
> 

No, it's a false positive.

With how Smatch works, I don't have an easy way to silence it in Smatch,
but I'm going to publish my AI skills file for reviewing static checker
warnings.  Also I've started writing a new tool to help filter false
positives.

regards,
dan carpenter

