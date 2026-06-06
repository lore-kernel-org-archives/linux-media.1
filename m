Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E746123EAB8
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780740753; cv=none; b=uBuOixSVOixLWGMJMfxQIevpIvg8NZsQM6RzCCBusbrJD51xAdHsls9ONMNLIgdN4gTbrmLLOts9gTARhe6Ap2oPe8rKmqW+8XzeEKj4nrdVY1pjvsd8myAtKYUzjRatlM8ErLcAnqa5gB3ufa8dsIKEZJEcTo6QmN+OY/IamSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780740753; c=relaxed/simple;
	bh=TE++nM4Wwd5ozZqtx2iL6VDzdT29u/7ZQlw+SdcdkJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttCF5bo3fF8LPxCO+8A5u3DlmSDbZ3xii1J3+Ogl4tFsMHNAfyAya45da0gdBYjBQiupa0huo+bK0TLRUgYD4lTH3CcfVZYr93eXLGhxFRSoh0oQ9Gm9wlc22zN+6Y+gaHwgwz5MVm3iTFvnOAYPCTlmqfTQFtR/4reUCugSFZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Razc3XRF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Razc3XRF"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so23690125e9.3
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780740750; x=1781345550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wazHcUbE8DAQ9Lh67uXmhqDsxXBo5A1VJQ1lnl3eDOU=;
        b=Razc3XRFt7JKLd37r1yW0dgWIk312fDvpytHgWR6PWLE3RlRXpf11bUSiruxpur/ge
         dj3ZhjbsXKfgYiDzfSpPY611mxfHvqFoSYO5KsbQEGaEvqLubMx/2dIP46nw1utlD8LN
         Nt4tqoBehuspuXaVdoeZXnFv26HUASz42avs9a1owRMDGCevY/5gACHbgPSCYp0UC1R9
         5+2cBWj84XeOaMuMiFjmAW8cyxAmVwWAfTSTsGCvDiCOSUhonnP3wgXsikuX+tprAT4p
         plYYbNfUnwBckA5vfGOEChAF5lJYqk92AH+IZrNWf1oOpcLD/LsAciLAVypRr+5nDU17
         RFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780740750; x=1781345550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wazHcUbE8DAQ9Lh67uXmhqDsxXBo5A1VJQ1lnl3eDOU=;
        b=g9bIZkJ/zPmoipwTVW55AoNUgmAkFAl690z4zim/GUZmGZ/p9GNiRRARo8Y2aZ9wJW
         NRJMOm9TcIsMEIfEaZuOXB8yDJUNS+pHRE7iRJEV2WI5g3ZTHkMlHqgph0cYPdSyfiJt
         MgpvcWx5XRVdoYgyJeLlIV2zRfGzMPg4xxItH8DjseVB878ysKPPXrg86kWekH1MhHhJ
         sW3vku5vkGexhv7KZZ/bk4J1RFn6e2Nda/4NnU9R50ccwbSbR2AJrPgB9OeaevHmexWv
         7EmjrbSoEY1XveWGgZLBQeH1s38f9hM+IM7PYUpddg0Vx0P8Lp5Zrng3tcXTc4xs2lPF
         SUww==
X-Forwarded-Encrypted: i=1; AFNElJ+Txpm7ocXc9uiSwDD5R2+tlWu/FOdGiqamYYxEuXxXPeMFJYwhK5zjuZYVboWYflHesSWuzHXCcvHOGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWr/wrozDX+21SivSmHNd8cS0/BoU7OJQUT2QF91X4Tw7/F08o
	4gR53NB83EepC7Fx1ihuwhz/gGHxUgu5n8Sw/F76TmQziO+JroaQzFeD
X-Gm-Gg: Acq92OE7QdoNHJYZjbCLnpXKMvCJ+NvuLWk8+pkkHzJCke4tVbv2B3281immwvbuqVh
	F0g2LCHFj5waM38WyNFA0BhwMmRoRk1Dyy1xboazB09jdRYBl85PtZM9KyrtFdKvpCzySgJMNk9
	spC8w6PRbGC7PIrkqeyIbNzM+qvlQv18Qihjga1ykLOQS0DZVttEpuyegACvlamf3JIkyagjBeN
	1H9BjAMfQe0avIMlru3+BlKReNgQAnD0fFLvOLGWVAzB+XLMETIf5GxkMhWKV2NppHyMdXYS3Wn
	fv7verazO29fobUD54YL9d0SuREpxzK8F0WJZANLETYhRV612xVJuc7DoG/4+C3qzkxFJIVAczn
	i6cHMG0a7dt801YxbXpNYjB+cvJygAtH7uorXifohN33nou96GglJOy2XAZW8o+ruLVrVSm198t
	LlvUk6zHyWJKnWGnO2+HAA5w/WoXDIZVcLI+OXprrb
X-Received: by 2002:a05:600c:4e55:b0:490:b642:ce29 with SMTP id 5b1f17b1804b1-490c25bec84mr121569395e9.8.1780740750095;
        Sat, 06 Jun 2026 03:12:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39eb04sm224957455e9.6.2026.06.06.03.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 03:12:29 -0700 (PDT)
Date: Sat, 6 Jun 2026 13:12:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: remove unused macros
Message-ID: <aiPyiUSPhy8JaLON@stanley.mountain>
References: <20260606092842.179826-1-rhys@tumelty.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606092842.179826-1-rhys@tumelty.co.uk>

On Sat, Jun 06, 2026 at 10:28:42AM +0100, Rhys Tumelty wrote:
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 4026e98c5845..0eafd81c44cd 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -48,7 +48,6 @@ enum clock_rate {
>  /* TI SND9039 PMIC register set */
>  #define LDO9_REG	0x49
>  #define LDO10_REG	0x4a
> -#define LDO11_REG	0x4b

Don't delete this.  It's useful documentation.

There are some other issues with this patch but I commented on them
in my previous review.

regards,
dan carpenter

