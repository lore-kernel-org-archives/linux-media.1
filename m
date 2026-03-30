Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C822A3AF646
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860919; cv=pass; b=VkNwZ3np1Fr2o0eSewktiFElyHYE3nCR2j0CW4Lt3Qk+FqIvd+BP2k9swWAkK4GVirHHVPcTdkn4iH8YmxcW7dUB7mHCpxYZgYTTHLrY1JZ2bC3YFoEl+3z8cl2g8jVZwghl1irSPzImia6Mm7w373vx3EL07JH9/tb8kOkGExA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860919; c=relaxed/simple;
	bh=9Q9JEGkw4BQdruA0mUjl1v8bI+C/2rhy+ihIFm8QwsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHCWx52alznn/jp+K0du5mVPxd5iVz3Y13jcD0AtmqidQj0xodU/6uTzonukrCReTdh1jT4A5vVEWuls/j0noz0xVROiLLPiR2W5J4BMz/hqWMukcFl6v1atm5c6ZMaLWHjMp505xpOfCMFrrGSUapKWpI8yJWeGWEkOszaZRUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihluCH4s; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihluCH4s"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b97c44417ffso433576166b.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 01:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860916; cv=none;
        d=google.com; s=arc-20240605;
        b=JMOAtqXqF3wyOqqrhO48d7cuC+lX1DMy5iZNdhX/pjDPsohHI4XIB7FoGfuSu3PrEw
         otZJmCbrg7aEw8j0bUIBXxbhGpG/h+BnBpDxZQu+vuDPjOtm7RDoIfDLolIR88hgWAF6
         F167ARoRPj/T1AEz1N7s/KJ7lbhtSkf2SnPhwnwUrRarB+YAWw5eT1O+qXVTDcI+IThZ
         r6mM96oOHxJIFBPebKjNLhdOQlKZlOqu1GLMxAoZzyLeFgN6xQn6nh+NIhHTRMvs6d3a
         TZQp6wo+ACQGuzOtBbAHHKBQK3iwFWnCdemYN55YmT5frEZ6G5QCzoZKksdPf0Syx67q
         xDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Q9JEGkw4BQdruA0mUjl1v8bI+C/2rhy+ihIFm8QwsI=;
        fh=ythH9kQf/vu8/+1k/jahc4zZUnZ+1GUusoY1TUniJzg=;
        b=kACublg0Ed/NUPdPi2Zh42UbeWNca5bPYF4p4M+Avm+XggkjjdWPHDzBDGsmYcP+GY
         1KU9kRQ3X8M3gPk6aN5Kv7tGaEfuz0P6oXMTjwTshupnsQgPRry8URdpq85NxHkj7LBZ
         9UUf2Ks7X1XgFFgoXqZ8/5YlZYudhgm/rXO/o/kUq/emDlq7zo5HPRwxzNJOGin7SGnB
         gtaY2YKcm32ducROJUB2cKAwxgpD0PudwNVQHsFkBxQzZFsXghqnyXrmVHvPiyv7RkNO
         lWY7LU+9nmcLD9jUfckIOHpNeP3LtpAevD7Wlq/Xkjz+xEG8YfPJIoN/D3wv5gwnJyc0
         GKTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860916; x=1775465716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q9JEGkw4BQdruA0mUjl1v8bI+C/2rhy+ihIFm8QwsI=;
        b=ihluCH4sV8yRB3e0Hz4ju5+bqLUnkjujOCBV5txmvke8ILICmrpDNNV2Ayy9NLHAmf
         /oACTtI61BcXgFbSq7EunM5mQcUVIlWMxxU9iAta1g6xp15IO+6uQTe+Sl6n5b0k5/zT
         Jskop8X50I/rhYl/ZHHWINSk55SCWG7EAwlkWZDukIAwJSaRmKEOdviiSipFcsPVL2Ge
         +bjiM1999BKVw+2g2HhTuMDHAYgaLIKnmxlZwYFYq0R2qn89J62RysA0N+L60GEI74MV
         IcGyacv7Pv+BTjKLMTgU7YqOlqXk0V1sYZWd+t4OG/bPJJUX/Ncq/2TF4vvDQzeilMHF
         tETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860916; x=1775465716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Q9JEGkw4BQdruA0mUjl1v8bI+C/2rhy+ihIFm8QwsI=;
        b=dEKxT6Acq2JrjTMGEzwFE4fbs0Xuz7GzLTC6Ef/a7GMKHprbMMNaW0AlLlkbJlA51E
         NWJYflV08NifKHl6T0p4pdI1aQDEPJYp3s4gfEieosjcDJQiu5KeCElxhFzVpLmBC6mx
         dCFwy2IunUxgcIUmij6Cs58aikAibVG/eOyCHx9ZEF8iDqAfkdnriKMiIadV3WKJPm2J
         G0cD6A2Z6d/CGhbspHDCRSP9GUIp+/Q1LqtIqdMqZiDy0qy6xbjOusdC+dlTxwtq9pJo
         Jw+0oYmWLi70cRvs+6jto4qripHufEmTmD+JDFwYcpWQeH7WclWMuXOQelWXm9IfHa8j
         LhMg==
X-Forwarded-Encrypted: i=1; AJvYcCWAdMwkCFGJF/UgNmHOCTvBVUTw4c1SDRJi9lmzIuFxandyv0T0M+idYad+HfNP/fdqudwXhPQc1DFbbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkT4WZ4Mu00m5fSR57IpTdM1tLy6rRKpZulkpNHCB7+H32VtW1
	MdqJioUbb97NQs1LIyKqM7HbJyZzIWEqazlMICcgXTOn8IZW7HTS0tt7QDN4QUIzPNIlInV3KMO
	kUQOFkm5pSsItG0GfhhzTCry1AwNiTTk=
X-Gm-Gg: ATEYQzzxl51f0gaoIwjMrmcNBWm9Hd1iEmU2AphQz7QPf/2C+IcfJuziKOeATK/iWZg
	F5JwJcaRUkCoqdC3rZx5B3vUyN9Q7p4guk1no98uvg2dre3MKZ/LnYCuNbSNb51jgoRnXgbkQzT
	GEVfai5lIkIqTJBQsfVDP+eDiOtp+PmhF25ScsOq8rJq1Q3ngVC68t0lgb4bgcUSxmwLUoe5m/k
	Assah82IlZtLT5gNb2kM2K83+uOKs1XBEE8bzK/JSq/vOh0v/boXv7je5UYdsRe+mWhbM/Z+Db7
	xyF2LvcyCHhYkrQ7MaFP4sZUbCwM53oEJ/0otLacQSomDLwsbeL35xe9GaWrPNxnp0Z7A3+sgOd
	9d2gElmY=
X-Received: by 2002:a17:907:7a89:b0:b98:9da:4d94 with SMTP id
 a640c23a62f3a-b9b5095e40amr779922166b.48.1774860915908; Mon, 30 Mar 2026
 01:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com> <20260330073549.5782-5-robyserbanpascu06@gmail.com>
In-Reply-To: <20260330073549.5782-5-robyserbanpascu06@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:54:38 +0300
X-Gm-Features: AQROBzDGxgPrw5tSDCjcr3lAOZiimubfJ2u2BqmMiahhFC2cudZ_awdZhqc5uWk
Message-ID: <CAHp75Vf055-Y=VnmEeHHP9icUsB4gWm8K7HLjD1M29wkvYxO=A@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] staging: media: atomisp: remove redundant blank lines
To: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, d-gole@ti.com, 
	m-chadhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 10:36=E2=80=AFAM Serban-Pascu Robert
<robyserbanpascu06@gmail.com> wrote:
>
> Remove multiple consecutive blank lines to improve code readability
> and follow kernel style guidelines.

Unneeded churn for now. This driver has many more issues that need to
be fixed first.


--=20
With Best Regards,
Andy Shevchenko
