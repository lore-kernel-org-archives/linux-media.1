Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74F74A2E3B
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946938; cv=none; b=sM2JMT7pUSpNSMZLzj15g8LGYHz8bzvcHwVkXqQJajLP4bQTddoMIcRxZJazKnfDEhsmAOv2ndFNhhrVKY1P3Tn6cOyqnvKp1U1fBvVXsw5XH0R6XEGQj0VlBfEVih4WsJmilb+I3We2vkqpGr/gmc+j6iXjftONUzKYNLIHkck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946938; c=relaxed/simple;
	bh=IqwxlwifiDOvJ55RY95mosLCsvDVnCt6eiqXO8Xuq+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BndVRcn12HT0x+dEXrrYxQVESuEUPTj2O+J5oAVoBERv79UQPi05PixKW59cwGWDsimYumIKnaHOUR7Z/nQFkbIyMZF4mIRktv2s9XJz/TMxpSG5opZDnVhEk8wNNmaV9kUqLchEarMDsvaq2BHQgA+zUiCnr1alDaWRlTt4n5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mi8pGlHf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mi8pGlHf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so16507685e9.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946935; x=1791551735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I37ZvJe5YYJIyvaTUxpQansTDIE1PINCJjve3z4TSNo=;
        b=mi8pGlHfq89n+y9tw1jJheaIphSaNpCxsmk2ItKKMFi7PxvS2H6xZvi3rEhiZvWfog
         pNJxa/Ki1YO62u3XBbS3LwoFDkhP2Pr4eWgZRnQXPf2HJbIjPF4lbw1/QZ15AYnzl1JL
         edsXzDj/EZYsb/aImVjG8n4qoawgos2AgQUiQzCRM8qqObNHZ6Rqt6GnmrK6S31dRV/J
         Aa65a8WDCjdOgqWL5ChFYSHG5N2rlyNx01nzJMh8n4paJ0l48R6tQeOMqIjgIZcw0Eim
         Sa125XcaUm3JeLb1xPF5B/leEFPvKxaNnEXp6NrygDDg8jVG4Abq2HZFFCkAQu6Cl4xQ
         WIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946935; x=1791551735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I37ZvJe5YYJIyvaTUxpQansTDIE1PINCJjve3z4TSNo=;
        b=1d2a2eLeIphy1H7j9/bTTME01TcC0Lqu/RI75fkulWK7oiTbWaDAck/iDZANckWE/K
         SJc0XuQGymVhgGPuYt5jEPsJE9yhih/Nb+f00OExjwP9Vfr/dM3tPAPr0n8AECNf0YJG
         ezUhoWA+RmZB/rIbyMtFqNsQ5cmEne1cPise0oi8zFg5Xfrq0P20tA6OA7fXxM8uU3T6
         qJA/pSY4h51ZIEgbuYnkgRNjAOf/S5v7jkvsbHwMlvO8OboI20P5mtJTx10kj6Zrkkua
         UknXGqEaoEIa5FKzhY5OiPCnqqN3l1h4kssJO5+jDV2erG/voKbbMyI+zxqJwOBJP/dH
         bDkQ==
X-Gm-Message-State: AFuF++mO07d6Hj/GF0cbg+1P3PMopILu3EV8L0qx7L+PhhBtiUJSOpjp
	dpZsGtalgWnH06PxmXqXrsCDF2vIqgoFB/BXboPG77S5l+uUfDbXvMam
X-Gm-Gg: AYBFou2OBmE1tLRyqugyXxdedf1QfE4A/I95OVQnN+tIPqIcHq9sJcvlWX3+mwkZB1x
	6nZYHsCwyGSV/6gzCk9wZKDBuNQw+TRE9mcRfV7Mka74YEtTFdPSaJJtpVTNDE7iAbVU+SO7jBp
	4HO6cuRTj92aFjxv2zl8hoZ1OEWClizf2F5OcZAlONdnZDywY4rCWYJza3K7j+e1wYYKOGoeb4d
	xhHL0JvZsZUnnjH0+oLCq7suSzRK7bzn8oojkRDD+iIBeBp6FJJg8wf1qrPqhj8ukqpc1JsDoEw
	LKghhm9J7qlveKdkpcfqpf91fGRaOVyvVZxlWLLH1PY8PIWPwkTVGKlOkcm9iwjx6x6ZAXqP0EH
	Tg0kaM/al85LTGYdIKlhnS4C2OYvEWsMjElajzdkzuk/a/eOexVeYalaJ43/feW9DUHgXJb/Dep
	my3jQK5GsUkdTEWtqegH2aFYczRTyeoBTQxMHoAj2kMSVtLsZ8Qsh/wG0yINVuYLEmwM584dNmW
	6eqBg==
X-Received: by 2002:a05:600c:530e:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a027534c46mr49593185e9.6.1790946934539;
        Fri, 02 Oct 2026 06:15:34 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03048abc9sm28671515e9.0.2026.10.02.06.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:15:33 -0700 (PDT)
Date: Fri, 2 Oct 2026 16:15:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT
 gain setup
Message-ID: <ar-ucRuVSTzFAVis@stanley.mountain>
References: <ar-JBnMLiUci85O9@stanley.mountain>
 <20261002123738.734633-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002123738.734633-1-mauriziocasciano7@gmail.com>

On Fri, Oct 02, 2026 at 02:37:38PM +0200, Maurizio Casciano wrote:
> > What is the actual warning though.
> 
> There was no Sparse warning. I ran:
> 
>   make O=/home/mauriziocasciano/workspace/Yoga-Book/build-output/media-v7-sakari-ov8858-20260902 -j16 W=1 C=2 CHECK=sparse drivers/media/i2c/ov8858.o
> 
> as validation of the final patch. Sparse checked ov8858.c, emitted no
> diagnostics, and the command completed successfully. I listed sparse because
> it was used for that validation, not because it found the issue.

Ah... I was so confused.  In that case, don't put sparse in the tags
if you only used it as part of the QC process.  It's assumed that
people will use various tools including Sparse for QC.

regards,
dan carpenter

