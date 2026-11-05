Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878353;
	b=MNz6IbYwHa6Tplw/Lyh8A5BIx+A0oGPj5u/mMUTDqhoIBJJzOOGEq8t1T1f7DFWFZoXm
	 htQptPxb0RMyr9J732P7LWwjAki7YsDEjN53Z/8IYY5HmVuS5pOsEFbfLFV11CdWdQaFp
	 DcKoGXx5lSKKm3JEOhx+gYIwrnaYJqyXYwLKllhkMWLvM9CMBsvveuRcMaX3WjhUmcd42
	 pxcgAIoLsH8INiLa9Nk8qFBcVWqkkH2GME8WRRBN3V3UMY2Rb5VG01PY6ctQksXetzGB8
	 5JFKxiGzV0ZIGXQXyJRd59QZ6EqayzxJMjicg/YNHysY2Kosb7yCDoKPUM78TxRBwIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Hv/YqhUcbRh9eWhND1HEmPv7Wx8/p/XxUOLWb+cXlc0=;
	b=O5dsQIovfsItxU6NpS/arEkTxrrS2pppMeAUR8JYiWqp72nuQ9jAZeePQqSO1nTYz9CA
	 usyy/HHaQtpA77IU4s1/XX6vW975Sjod2ETU2FWqqlFGsvk1tjdbxApAsHqTnrdAD4mB4
	 E2Y9rLicGnEIZ4/EjKNH20LcX/GyEhi82xEsfdjrrsybXvazzVkt2i8Ij9LfD0TM8fkUQ
	 VH1tNN5NCMpPnJXaOpxicmubdNFsHkNohtZPEvl6ioKneEByuGVquo6js7puc9opDdC1k
	 gnv3JU8VT+XUfau5+GZdNauf61pLONnBHrWg0aMsVgaVuGWFpnztbUc+eWKF8YXCkzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gCzhsiwh;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411EA606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 11:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 411EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gCzhsiwh
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49231763f81so14044f8f.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 03:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878350; x=1794483150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hv/YqhUcbRh9eWhND1HEmPv7Wx8/p/XxUOLWb+cXlc0=;
        b=gCzhsiwh+9TzJMsLX87aGG0KzgXUNwVed4ZEt2dCuLs93W8hNgD2S6kh7CnhDWk6th
         c+/CJBoTDuiXWkKZxA4OBTMoAeBM651auVk8jLmD9tODmsIIGa0CQHfpUvEnJniX60g3
         4eaKVYlIIWc+97nFpdoSr0V/kz9Rm5Q7npP/adX545XmrufV/7p+1FuacB+TRxp2iMHo
         eDELcu9+7/fRm0sCUWh7ZPZLywlbhqt1WfY5cSBiksN56N+g2mjgxr04UtSMjA94pZc/
         ICfzzuVeqGRiu8Qzh/bnysZ8Ri9wHCdM8ME6YT9AM3k6WjIOmMWucFGBt5fCrYaVafip
         KyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878350; x=1794483150;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hv/YqhUcbRh9eWhND1HEmPv7Wx8/p/XxUOLWb+cXlc0=;
        b=bndb0ECAsO2GlV0OU0UNYp1XwQhfE7OMle9opHt/CxAJO2CBjot8HFz3CQdWn5/U0Y
         W21J0zPgMWjYR03mk9GJVt8oztucHAD4Xp6NdjJubeQERUKbMgN2wFvQwd+RXVvSSk6S
         TizYkVNInXbFd6byVfXDiXx1uxHwFwFtHVFlD5XkV2Hk+LMyOQwsNKinysEK5+u+OA1Q
         HUbKLogHJdSiMFuupBJlKbABkQeIsoS5waIUsHYdck4emUKP4yfBUA6t30CTifakedkq
         pmjniaYEbR4dbXx07AnJmhFlLRNphnW6b7qF3R1grREkD0TkhGgssraiB6EzFhGDD/i+
         BaEA==
X-Forwarded-Encrypted: i=1; AKwUvBxAc5Q7eZneGqyv9ouB3e2uVSrrQNS7HZ2AbR4CNvw6E11yJdzDAfy0wGxjooABoOTxRVih0e9725OQ8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+EzNUvF7B8vJpikVSz00wNnkXGx5aXF6XR0hCKzex0nvspcjoH
	PQpOs3ItDFFIh2h0tAeEXi0Dsex7eygUCPeNiLRSYOGp0ro7DY8VZjZu
X-Gm-Gg: AYBFou0GaQyn9pEA7TTLPPH2187KegeVNWwPilLHM6yykl+RRElhk+2hGuQI4DU0Y8U
	5h8YliltFgXB3GIcRGJHjhei3DaqDzF0GUfunwyHnofaJiVkZy7rUPR1api/oNxI6en4aDN2GKS
	eODL0igWy7/ORTgJdYaZRhu3RVy75V4g+vpW0U5etxLOr/wt174CNdqBWkcFkUrP7pgbGwaTz6Z
	BzbmtxqarnuqKVbb+pnLudDxfQrNiz5zCo1zrjQ3taxDybSDnCnwjxQbnJ9fnb6xoSAWNdEgZ1U
	3g/Yad9DmDtOl+0IXH518BA/LHQAgXOmscr/5B09/wJmMaq5TCXxdkfrVyjXACSBa0wTHreFNvx
	iIeNsKvWyfMRqX4GJ74T4kD+i4/67vDIAAOzr9gKPwBjYaB5Ha+j2ltXKRX3sNmgXUPMCguzX1T
	fI3o46pHwOwqAoHp+33PWpCW3Ac82Mv1UlXLOThs8wZ8LEAX4W0vPUivAv2uIcQVfGc2t1Yv5Pc
	dWLNa1SUdD8IoyXmArZJRE6XYZcYc6Q9uxsdOrxcjCWozcvjzSBfvIQrwutyLNKYk80L0ky577b
	veJrf55BRHfUMXF0FtMjOKiy4IRFHo2WXAsI2Iuhio4MiAyL2dOSsAD5R7UXaarN
X-Received: by 2002:a05:6000:46ca:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-48e6e2bcda2mr28288827f8f.3.1793878350394;
        Thu, 05 Nov 2026 03:32:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm9469614f8f.21.2026.11.05.03.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:32:30 -0800 (PST)
Date: Thu, 5 Nov 2026 11:32:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Mariia Nikitash <nikitash.mariiaw@gmail.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com,
 morbo@google.com
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in
 sms_ir_init()
Message-ID: <20261105113229.4126d872@pumpkin>
In-Reply-To: <ausVkYs1-3rJ5Fj0@devuan>
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
	<ausVkYs1-3rJ5Fj0@devuan>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2026 12:25:17 +0100
Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:

> Hi Mariia,
> 
> > Date: 2026-11-04 01:02:39-0800
> > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >
> > In preparation for removing the deprecated strlcat() API[1],
> > replace the strscpy() and strlcat() calls with a single snprintf()
> > call to construct the IR device path.
> > 
> > Both the source and destination buffers have the same capacity,  
> 
> The line above seems irrelevant, and potentially confusing.
> The size of the input is not important, because since we're appending
> stuff after it, truncation may actually happen.

And gcc's stupid format overflow check is going to complain.

David

> 
> > and the return values are unused. This preserves the resulting
> > string, including truncation behavior.
> > 
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>  
> 
> Except for the small comment above,
> 
> Reviewed-by: Alejandro Colomar <alx@kernel.org>
> 
> 
> Cheers,
> Alex
> 
> > ---
> >  drivers/media/common/siano/smsir.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
> > index 283770d583d5..636ff228108b 100644
> > --- a/drivers/media/common/siano/smsir.c
> > +++ b/drivers/media/common/siano/smsir.c
> > @@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
> >  	snprintf(coredev->ir.name, sizeof(coredev->ir.name),
> >  		 "SMS IR (%s)", sms_get_board(board_id)->name);
> >  
> > -	strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.phys));
> > -	strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
> > +	snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
> > +		 "%s/ir0", coredev->devpath);
> >  
> >  	dev->device_name = coredev->ir.name;
> >  	dev->input_phys = coredev->ir.phys;
> > -- 
> > 2.43.0
> > 
> >   
> 

