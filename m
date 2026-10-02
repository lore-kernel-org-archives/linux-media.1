Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28D747CA90
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937359; cv=none; b=K47xtND57UuSn13CmqY0Uu6f1sJ3HqVsNI/RVtEFaI/aoTs7X1RuCNDNvbSql3jB/zCURn6VX0StOnShMoFDhIxeYvWaJjQrktKa6TCU/wr1LjhcpLJSNF57S4BW7OljtyqPGECfIis46diWCvnOWwZvOYxuT+RT1zHMEF1Nc9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937359; c=relaxed/simple;
	bh=d4K87HtJFA2HW/3+ohk+qJSxkMD0K/tNiP2eGdCmh9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwMYqXR6mH7o+ZYQvL/R4UVsw/36gx+fcC8J8g+YOgrE6Hrx0tNGxljQxtiT6jfMLO/0u+TQ1ljkoIUHz7Nz8wklJxnJ6OQ+YciV6U24Hm14Gh3zsgBNNnl4kBk8tgS3jDjKWh7ZJvHdGqdihtP0Y39GZbYmk8kqEEdvPGphQ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8mcn8m4; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8mcn8m4"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so4529644f8f.3
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790937355; x=1791542155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1ZYo/VaLI5gMMUDIzvSQ30gCwl+j+w8JeLPDO0BjUE=;
        b=A8mcn8m4dixbYVodtIyDY6d+2NkCZzPwJ1KhfCwIoIeZ5fMi9hG2bp+hM3G4QdAgPw
         g9HKBJatxTgTZkXl4x2XfcMEkQ7BzusLl+YttSaaR7vyo6M5INDhmh+hMyzjf8jOxS+n
         FV2V/NEPcyYFYeHioYzN6LDb24WZdt6RlkSf1FhFTuoyOS3qbnBhHuz89qsBgPqX7KTd
         KI0/nVNwl2xH86h2Popx6Ueawh5sSRuVdy7aZmzFxe3ZzQ7aXqh7P757dMF7fZudj3is
         tS8eSsL5BZPCPLa++opi9kTSHXX3hku3YgHfiCoYsqpssAVeif42QfdGmNh8q/zMvAGg
         XAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790937355; x=1791542155;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1ZYo/VaLI5gMMUDIzvSQ30gCwl+j+w8JeLPDO0BjUE=;
        b=JGC51xpdBiKGwn1VS1Fio8g6W/Dk1ZyDd7Ogdyu61rcbDTJkX6VJ7mKLkHPFe2xnNr
         HOrVasq2sbRiIugqp111T0X9slP1j/hOv/QOicpiwZ+WWzTTwbqm+5ZaNppHeAsJnOxg
         AFR+kKYcpCMzRVeabHynYoUqQfkoxvLBmjN8mnbZ+3qNBny376PpyXxaidp3vYJDNl2K
         gMTU3CN74GMvSRdyXLBcPh0bwv+ndTfxJb/8nFap8vCc1DNS7/33Uo8ds5Z0Fk9lUPhA
         DKKnzSjRDIIpufN2Z3Ljk0HTXj29kuUJuiq2cpZvfTpwmytArzorHQyI7LgR2tmZvV//
         NyYw==
X-Gm-Message-State: AFuF++k43Z4xyyBXbkXxXz3ioH7tNKy7aI9egnsaFuBKK2vOoj4wcK0F
	rwWMot64MQKF3TB0793ixrvVjk1wHsSjDmOmlC9lE/DF1kYc8PB0xUcW5Sb3KyPF4tGB5w==
X-Gm-Gg: AYBFou1Rr8Ip4DW4BGBHMh8E1hLDF7ymY6lsw9EczaKY2lWVL336i8nAnq8c0RjOWQE
	tP1DHjY+Pmw4hXninXt70VcLdcsL5RB5LhvYvk6qX9qH6ibj268xRQBBqT64FYJ/+apoVCkMGki
	KOLej5a6YGAYsGku08WMI3fc1YrbOHlU8MHtazmCulSY1d7Adx+omL8uaGKe3esadaAGuzFMR0l
	mDVBKFZwCyfKjm5kSY3qkxRiET3XEuZTQNTHl0CHzJkMOZQ6iKBBSZClJRKCmj9lTeulC5TRSk1
	LCzd09JwGjxbe4IWpDPcC+o3jxgMlZKYqiauTlJlkvQScruj6/AirNMDnccbQuSTwATp8PDgHEq
	PA9MTANVb+zlh7mIJgXc8fwM85kDNIL/t2kZgthublhjNyrcIQFHERX1BVdbKygTgmyHEM0SxsR
	iNsRvnXX8WSrH2fVsYCS0AFMgh9CisuyQQs33j1vH3ToA1jN2rq0CvwCOcLx58QY/CE94=
X-Received: by 2002:a05:600c:8519:b0:49f:cc2a:f73a with SMTP id 5b1f17b1804b1-4a02769f7aemr46595305e9.25.1790937355000;
        Fri, 02 Oct 2026 03:35:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f06b3sm4848828f8f.11.2026.10.02.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:35:54 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:35:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <ar-JBnMLiUci85O9@stanley.mountain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <628adb1cabec866554ca26a2da5af860b04d6cb1.1788360629.git.mauriziocasciano7@gmail.com>
 <ar-H8g9RnhujCvyk@stanley.mountain>
 <CAO7O_xhgUqCuHZUiBpjL_jsMrzG2grwkNzdsdBW9SiHW=rTfCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO7O_xhgUqCuHZUiBpjL_jsMrzG2grwkNzdsdBW9SiHW=rTfCA@mail.gmail.com>

On Fri, Oct 02, 2026 at 12:34:32PM +0200, Maurizio Casciano wrote:
> We have to use
> 
> Assisted-by: LLM sparse
> 
> instead of
> 
> Assisted-by: LLM [Codex] [Sparse]
> 
> or other variants.

What is the actual warning though.

regards,
dan carpenter

