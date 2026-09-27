Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA202346FA0
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790502023; cv=none; b=gK8fyIDBzGWbdESL2ZDA/O/6gXVQ5HbXyOz7Ow5B2+7ilsTHJK1NBVA5AcWu1ZSXX9iQVMdPaSUwx5c4Gl2NvwSkcCzktoIjCMsTRPSVJUAifoJTWjlctPnsffh8FB7yMKxnC6HaN9tMO0p4cFNyKwlRno5+NYSDTRhqzrnDvAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790502023; c=relaxed/simple;
	bh=0Wdehb1mBLpyoa93b+kEGpuanCpMN78JG2kNibMf1T4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k3wPOJdnjQcKVKJDEmgJUHly/tGhTpJLDuFgHyubhWMu/VWmOSFK/urq/agJ8mhE4hs/s/wIkSt/ejQ+OFhTFkTlcgAMH69TzM3wgQrUTYksv2ikXqLn9BIyNxH0LUK2Cu7Euj7F+KZPsDXk+FdFMbaYUWNFGTnExH/jwYbwMJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN/5fD/x; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN/5fD/x"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so11385295e9.3
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 02:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790502020; x=1791106820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iUjq4Fkk00DMzi1x+hfu4xvxG3GNiAdD8cEsCPzS1nc=;
        b=dN/5fD/x4BpE9SJ9uS/PMOy1Xmqae+mVGPOgB3ZEr94m1f2U051f05k8e5K5/J4QgG
         q5/YbdrkWAnRsM72IoIcVq65JOAgWU4r0ybZmGMq+tNLcz+4/KJD0mkHEH+GSrLGrg9a
         KNh5gzfBDoz+OuRJVrao5TFbP4xldnfnT3W9kXB5nmRZGNVtCigTwpHGh5STrN499PoP
         EZ8B9jDo5VTNgaExUhvxwvSMch0mJbrQu7YFikuvotFkf2+k5/sUo+VKM9UZxHGKPK1n
         sj8AOgdefEaQPhE7ATeX7LoxPvyt2JXUxxHd/lDiYoNB764uUhUOV84yxe5UXUiShKpd
         Guyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790502020; x=1791106820;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUjq4Fkk00DMzi1x+hfu4xvxG3GNiAdD8cEsCPzS1nc=;
        b=GLe7ZLcT+kPkEo9iUREIkwos8CbVkqAu5tB/fhzf2eZC+yuNFitgJ7ztQnSgDYL5pR
         FN5/3meXcYPRWHNcvz8BHyB6CT1QqsMobXmI6svCq3lagwjz8F547AmaIzf2aS4eUZer
         yzkUSIBVmyvQnLWwx5IRyKXoapmDnuIIB/rcCyGWKf7EtjQSW0VKvnxH0ESn21TWBzRQ
         fop03l6JTvBB52Jf4VVmqsLRrIYSWAs2YPQRlN5YTgOE1QZjtakxGCflxx7trAjpZzap
         OWP5xqaUIDgeW3N/15i5n7kpkXSvhnsDu38nIZmo4uDfr6e8yCG099B5qupB2aN6I0FA
         DjmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy57eTsvQETSaOoobY/97ZIJhOBg+9mVNbXX0D7qBtHuj8WT/BUjNQ5+xrkp3yPAZzuTQwhlkbIALN3rA==@vger.kernel.org
X-Gm-Message-State: AFuF++lrcshGlPyRi/lcZp5plbUNbMyt2cuYyv+XE+BwWWFm+dLkob5t
	e53fV4mnKjhf4ysaYO2QcvR73x6Zf745fhguWv1dhC9ooha9L516EGqJ
X-Gm-Gg: AYBFou1Y9qGQEiiqhTTtatztLJCVPa9ulGvpdP/Djgr1eZkBvVJ2rOqI/pdddo2fZLl
	G+CIVVUIZhXQ8KJD9WxSJFryEAAqXuUk0F8iA2uWmmBJ/k1vu66vOuCcU88BtCV2K+levhhRQ9W
	iEjMszJBxvOIlUpvOh+16W6cXYW0AQ4gy+Q5megIC5tdsjAnbc7ak3sv1NAgZ3CI/eQMPYI8CfR
	lC6Mgs36h8AOvOX9b+aJALNMRDbAg3CFLOy+Q7UaCuNXrForgQFqBC/O67ReoGCZOGYOMiOII5A
	v7a0dOPzEq+c4dTsaLpi3syOjsvBUEjXTqqkHYD9aM+c3GD+UhCKH7oRM22gPBZzOPMiSu+39g/
	5obiln3fUTmiMcHZt/GFt1AM7s6y0s8rNm7ZqpQOAoFKaSv+YpKpsF7nlX+6WGVrEvg7MQBPGzd
	T39pY2O2TJhtrlE/UlvAwTSbknRp9xrMTkWCnw/gyRv1XHwT0Cj3SdcYM51bzdK+EWEafL25KE7
	Q6Lj6bMpg==
X-Received: by 2002:a05:600c:468f:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49fe66e6438mr185790605e9.18.1790502019850;
        Sun, 27 Sep 2026 02:40:19 -0700 (PDT)
Received: from foxbook (bez152.neoplus.adsl.tpnet.pl. [83.28.37.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ffd137346sm77143385e9.1.2026.09.27.02.40.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 27 Sep 2026 02:40:19 -0700 (PDT)
Date: Sun, 27 Sep 2026 11:40:15 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: johannes.goede@oss.qualcomm.com
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ethan Nelson-Moore
 <enelsonmoore@gmail.com>, Frank Zago <frank@zago.net>, Olivier Lorin
 <o.lorin@laposte.net>, Erik Andren <erik.andren@gmail.com>, Brian Johnson
 <brijohn@gmail.com>, Leandro Costantino <lcostantino@gmail.com>
Subject: Re: [RFC PATCH] media: usb: gspca: remove driver for old webcams
Message-ID: <20260927114015.37cfe3b2.michal.pecio@gmail.com>
In-Reply-To: <9d6cf632-0c6a-4f93-8c63-2abb7cacdeac@oss.qualcomm.com>
References: <6e63b180-d6c6-41e9-a2a2-78cced514f7e@kernel.org>
	<9d6cf632-0c6a-4f93-8c63-2abb7cacdeac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 17:29:10 +0200, johannes.goede@oss.qualcomm.com
wrote:
> Hi,
> 
> On 23-Sep-26 09:32, Hans Verkuil wrote:
> > The gspca driver supports a large number of old non-UVC webcams
> > that use proprietary formats.
> > 
> > These webcams are poorly maintained, have very poor image quality,
> > and there is no use-case for them anymore since even the cheapest
> > UVC webcam will be better than these.
> > 
> > The last time there was a 'real' change to gspca was in 2021, one in
> > 2019 and one in 2018.
> > 
> > We see an uptick in the number of suspected AI patches in this
> > driver, and I really don't want to waste time on that.

Well, quietly ignoring AI slop is an option I guess.
 
> > So let's remove this driver.
> > 
> > Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>  
> 
> As someone who did a lot of work on gspca I'm a bit sad to see this
> go, with that said I understand why you're doing this and I think it
> likely is for the best.
> 
> The only worry I have is that some of the earlier builtin laptop USB
> webcams might not all have been UVC and replacing the builtin cam is
> no were near as easy as replacing an external one.

That was my first thought too, because I have a laptop with m5602 IIRC.

But TBH this laptop mostly just gathers dust nowadays, so IDK how much
people still care about these drivers.

Regards,
Michal
