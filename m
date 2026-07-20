Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3843CF943
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543892; cv=none; b=dTrmYy47kN+rzpyC/JW8S1OoZ5AMTYt2K+8Z/Keje98RoKby86Er3Aq+WhxHWWNMQyvUAtjZtCLBlnl63wHapPZU78vyEu+IycMON3ev1tQeD4/W4AT0UUyfwLKm2DalD8xnyotBkDd49WQzt3Czb0Sy62Zjh66+1+7VR4bdd3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543892; c=relaxed/simple;
	bh=PcIqj9clG5vSHwjzka91hVCZU0Rl3dJ+gmavPcLWt0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfubj+Bv3vGYJ+l+yCxFC0/zGfELsOA7emKQmbk6WLuRQxgqyACyIN6v5EeHqeI6O/9MBHFSPxbLjMHezqZF/R8F3IFuK23gheJXeKfZBFmjB1O+XSjvVKRvAavQJVfMbpyhBpOJ9mm3E7RugKUEsS+VlGHsufzy9DU6tSLweWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZ76O/1i; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZ76O/1i"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb4d8a21a8so4264414a34.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 03:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784543889; x=1785148689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K1JwM55+0NG2uO4CBPpaDwZmw3eWTrlUu4CzH9U6B2M=;
        b=NZ76O/1iE2WsWyief3Ek0Pmz7INYGxNQuFCi3gS+Uepr0raIvVOJkrfSkJFPx0y+mj
         /PwvvQBWAxsPtij3Xd1umRCg5ePjsY/okzxDcprm2e6sx16B8MRhtrEzRalvGpVGz0iZ
         Ess7n225T16YArv5VPNjk7Zn5neBNad0m0Hx30nvfNugSEp8zdFzj8z1JJW6kcwHV4WN
         DAhgRwqWgV2txyTT89yBx9803anmA3zUO/LCSY8SGh5IAosCrWzHYUUBurqnFh9G0G1c
         z3rYnclzNCqa0xVhWbwVQJdc+yMwixwm6dTYrsl+8MB9IIRSA3Kl+6NAIrt8XT0MVrT9
         O+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543889; x=1785148689;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1JwM55+0NG2uO4CBPpaDwZmw3eWTrlUu4CzH9U6B2M=;
        b=iZwaQ2DJauEpb9/G001UXL3FEk/Coy00LLuWHVb4E/RKp0NAnJM846XicokkGQzWtZ
         tK5bVwQFsU59RDKyd55Ep5Fqogfud2TEbJorOP8Zflsa4lrEGcJQ55HBP7hQa7oeZH61
         ABC92rX+893GHYnnsDC3x0YZ4XAoRS8EtSeiVlcJyfpFuVVa6/4ZV3PAgLRDQlykI9Eo
         oqDyAmFzEMbQ+/XIZ0bxTyxFO7c/McoiHQBoQNv19Kne10QbBoSN56CM6nFsdyuC3yk8
         MurYKiGPI+lAGyRRek0hckIMritGjFevcGgpzeAd+tQlQk+qzI3MB56LAUG3cckECFG3
         Ch/w==
X-Forwarded-Encrypted: i=1; AHgh+Ro84lSPE3OcwVoe3YJ+HeexEJwilgb01Jdg1A8UieWRlw0kAshxSa5/FwWQdNCRfAVvVQ0+rXmMvi3x1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5El6xVV+Y/Ee2lbeU86MsTQAVTmOZ7scL+JFlrq9UZjeua3WW
	w8nF5MXymjYWDQZwtAARgyFVqUZXUCtQJeJrUsbaSxC641eMeePPW8r7
X-Gm-Gg: AfdE7ckp4Q7gkJDhcPnR7aJmaQhIEInEt3LXdUAGBrxRc9BAITndC302qyXlFxlvRQ3
	UEtPruzaIegu0GRHsezmt6OBAHxFE+ojnah58B33kyhQbsCg+7YHn6sj4kjwPYyxNH7xjzZyAtU
	/9id9CRpBIhb49+eZqYl6zKl3bpOlhduDGsDrAVXjrGticUL45Ueu8IpxePg5+lXuqi322A79mn
	dsjMcVeFDmhoOWu2siu+7m5ZvgM1n7p+woqXfXdb0HyMmx2Dakp43Kl42lF73LAIFHmSpTB+6Pq
	XmelUk/Oe7Fsr5VB/8DbuYTqdecRmCviCVWnGIlMzTlgwgnoXVwFrPhBiC8tffEUsBT8pdKvz7y
	QXrqRxFrXjVkcUEDnH2h34dGgFlI4PZShNoMb8UHZ8FZyiiVeVmmvTEj5//QZRCjyXBV/qtRky9
	DQeN+V
X-Received: by 2002:a05:6830:81ee:b0:7e9:b4d1:78b0 with SMTP id 46e09a7af769-7eda1157b00mr7640298a34.30.1784543889598;
        Mon, 20 Jul 2026 03:38:09 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad91b8a5sm7780884a34.5.2026.07.20.03.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:38:08 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:38:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: media: atomisp: Remove unused and unwanted
 debug module parameters
Message-ID: <al36id6uaqTB404p@stanley.mountain>
References: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
 <20260719140350.8266-2-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719140350.8266-2-prajvalchaudhari733@gmail.com>

On Sun, Jul 19, 2026 at 07:33:49PM +0530, Prajval Chaudhary wrote:
> Remove the unused module parameters 'dbg_level' and 'dbg_func'.
> Additionally, remove the 'pad_w' and 'pad_h' module parameters
> to prevent userspace from overriding internal ISP hardware padding
> boundaries, leaving them as internal driver constants.
> 
> This addresses the 'Remove unnecessary/unwanted module parameters'
> task in the driver's TODO file.
> 
> Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
> ---

It's weird that the driver still has lots of references to these varaibles
but the build didn't break for me...

regards,
dan carpenter

