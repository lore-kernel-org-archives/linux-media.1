Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF39374E5A
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790453304; cv=pass; b=RBjLVs3iiW7ZyHNxNCj7sUGMvo9vSLjSF+Lnrm9E1klZpJBcyzfv+APLo1PG8UcvS4svGvzjljfaJVUleKovl+phWaPjUSsu/VcFNlWmKx5DgNxMlBqS5mDzkEeQSYLPYD/l0w4SOa+3tPGx4IWRwwB1QXJ10g7KI6EcNMKRZZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790453304; c=relaxed/simple;
	bh=j5cJn449Zupx/yrvwZ/FfZPDNPlE7FEdRQOOPFzGeco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucHAaNOVQCxyhqhoWKybB6Nrtp+E0wkTnIjlIpPDmik3gunecT7w5mM7sm8naYhs8ZKQATBegQ4HR9YQ28XjaojiuNYDXT0dmIOWrdr+H2VPIKj0v2AkFH/l6MsoSN0P/h/gm2K3RYYR/oDzcwelmRPDqF92ni+OpUtIWa9X08s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZml13t8; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZml13t8"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-89666ee9b3bso13440607b3.0
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 13:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790453302; cv=none;
        d=google.com; s=arc-20260327;
        b=c68IEQ0U60LDSwpT2mlwBaFVhAPdtRMbGKy/SI4GtH6NsCnHLQVXU9TS73eiRZP0+U
         iGEolxhv5vw4ny/J31zLS3L/L62oOfbqbpkO0zYHarJ22yE8o0oOJWYuBpN25jJ3ahh8
         Nc5Tcz0z/qelflarquydC9l9T5qrscP5H6tLNh1Fjhp9wGqupy48nM0gscKJL6ywyUXq
         09yxOGb8V4F8IYbIlYAUBbNJHRZo0ncPjJRixlKuFH9P1pQ8UKO1ljSyoTspN1gWj9lX
         zBagPOK2Y4L4RZE6aRvs4/zkxKaUCMvFY09kajOBJUChEX6BJxDO3lJiiyfY3dDmKoec
         pIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxC0LKM6Lj9xYSTszPofCnIt6Px8YXou8XDsd//rGhA=;
        fh=C/SuhGVNLtswrMzvajK2mIng/A/sWi1WPrgWcp00Fhg=;
        b=Vit/LIoUUXn2wNdfp5wex7aE7u0VWZSQLdHJdBZ05x/SOu+UJ/9+4HPU/7FccZxjR1
         KFohjepkJyp/wJpleGB8fTg/66W6IdlgB2VuI7rn6c7KOAEMmgXEsfy7ecLDOIUX4zHW
         3D8irzWq7kHhKtTaEutS9KipQx+JTS/iX7Crv0uYEpfiAjtr/5x6oDJ0y1bJe75zKYJL
         3LY6rFJA67NrZnupfkRuEAXiK6c31fr4G0z8TKGh6mKZ/UZ9HqFUOEN4smbxO9nG1Jlr
         4vz97iBxaUwrlemwzmVhV5pnlls9AUOSKdx+PBtdEARsf/Crx7mJb+vVLMpcYiBI4JPr
         dviQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790453302; x=1791058102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lxC0LKM6Lj9xYSTszPofCnIt6Px8YXou8XDsd//rGhA=;
        b=rZml13t8IhfyCFiCb/mZdRbaebj/qub41KHRniJ1c26UmGtw+j9jwG2zhU1xy5qOXi
         swYzc6doKL3t9ckq53t+RPMlHXZ9EitNyeOcOb/p5hGhPN8setFhCDBhkYSRfyb1UmQ3
         Fe1wKWGo2yX/dXw8tFJJG4+/0u5vRJsksWjqgmC/Q/rKSQ8O6F0/BvcxhefP1vOxSibi
         ewXB7eZhSpbxfJEC+6GU4iIJO75vwujCZY7tuVo6hezz7EJMk7SPGH0oTWfinJK62rGN
         bw8pTTwUUIm+tLc0M6JWpEPrOCAbtOK1pDD0H9Uqe2OzP1qb6sNNhkXQ7aKRp2PJHkcH
         wBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790453302; x=1791058102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxC0LKM6Lj9xYSTszPofCnIt6Px8YXou8XDsd//rGhA=;
        b=XQY8+8NFOsViwSTNCGKP1k36uSaUSMzWfMG1MYzLNQ6CsNdTQ+6MQNjKFfdeUUSj09
         Hgse1fmA3WpkgIppbIPcA0FobWIp/RDHC2O5KoQlbpJ1+C3lfX2TlWGN9/Hda6jsfl6S
         qF28jzayFdlKIAggAfTHsjXNDRnLaog2jNjbHJAMRDqYi7K1FEnCkCVRev/3lp/dXj10
         IwuA1QqDtrQMxwtWfkM5OxYf0EFHiSvHrdhyv5szEwUpo87NCYPVcajGyWyOh3N1Jn+p
         mnpZsheccv3OZLuSGmnRTxDSl++JC2qZNvoe9RrVTelsZa++hB4ggiSwGo3e+RVDLz1O
         W8TQ==
X-Forwarded-Encrypted: i=1; AKwUvByDoEPwyWcmpq1mzqUvXg2IddxN/G9LJQvgLfdIGsNtviqu5AIQdB+TZ6Ebz3YvpWmXmamTRuXz0Mu4Cg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIATEvdobESRKKLhtAskvDrQsL17xtFyvGYijiXwBly5i7KIsuD
	WSiKhXG8QZeuo8Enx/seKb1+EeFji81vNYltGsHqDiyIUUYv+VLWJGRJG9tGP85BhxNrZqjzvs1
	ItQ8eb63bnXs3AGtPCZ3u0pmj4V1Wnrc=
X-Gm-Gg: AYBFou1csL9CIJWmUN+H2OuXxl65/LBz7c3qbUI345+PCSWPv5iB0ERjAsl5FzkxskL
	VbiIdz/an7QIrjzmOcN3QZSNuMFzkvnP1VN5YnawX0LzANZML/GO6KnURgHE7ssAFU+p+Bky5cW
	YcRfzbJNPTp/XoIwzq3X4h8CBWc05TUBLXfcbhPBbS02vSwz2Tn0awMh02tZK+NhBghQEgE7r1m
	ARfGPBmPRrngdK8Nj3uIgGbhziX1Ong/4zfzRbs9jTMkSwz/zOlTfBS2DIMDU+u3OQrXDo/C50l
	WTPp7O7gmJ8Po+xzQpRmE4TIUF2kGukN88ooho+QjtrM41cmCn18IrM=
X-Received: by 2002:a05:690e:12cb:b0:674:6809:6f15 with SMTP id
 956f58d0204a3-6746809704amr1146281d50.0.1790453301090; Sat, 26 Sep 2026
 13:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923015631.44973-1-ginger.jzllee@gmail.com> <arZUjd5QIs85m_Wh@kekkonen.localdomain>
In-Reply-To: <arZUjd5QIs85m_Wh@kekkonen.localdomain>
From: Ginger <ginger.jzllee@gmail.com>
Date: Sat, 26 Sep 2026 22:08:09 +0200
X-Gm-Features: AclHuK-I0JLVJ75bEhvu7qJACiRAut3AQtqKovfR8PWHXrTZb0sdeNSDLJWlRrk
Message-ID: <CAGp+u1aVQpqkyxFv1p897FjQMm=007FKiNBVDtxzU9pp-oJkSw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5648: Fix a data race on state->streaming
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Thanks a lot. I will pay attention next time.

Best regards,
Ginger


On Fri, Sep 25, 2026 at 1:01=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Ginger,
>
> On Wed, Sep 23, 2026 at 09:56:31AM +0800, Ginger Li wrote:
> > ov5648_s_stream() updates state->streaming after it has released
> > sensor->mutex, while ov5648_resume() reads that field with sensor->mute=
x
> > held.  A concurrent resume can therefore observe a stale streaming stat=
e and
> > leave the sensor in standby while the software believes that it is stre=
aming,
> > or the other way around.
>
> Please wrap at 75 characters next time, I've fixed it this time.
>
> --
> Sakari Ailus
