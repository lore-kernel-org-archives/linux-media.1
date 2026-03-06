Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DF7366557
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 02:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772765472; cv=pass; b=QfnoBy15RTR4zMX4E6Lc0KO776FpNXQbf6MNvHdoYETZw9usdZPJH8o6lo6bCc2gBGwuDKwPgtC18ZXmb64I8k18Xw/G4plyTpmtM3LiM1Zka7pcWiKexF3+NuzFDPJSojn7RQtoTNuWJMyggILVwvJMyc8KLgSK6BsU2qiQagQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772765472; c=relaxed/simple;
	bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9JFr/WPa8PkfPt1iLnTp5DKHGhnJ3o+a2MMgDrLaVq5RnwNMUgHhxWqCatnXPLQFGpzNwzjrLKSPweDIe6bID9dTjpgLIOWA8boJMmx6mRqmVvz21ZGvusqCdL9FqzGsmNPYwOTPTnwjpB7S+hsed5wQY2Mr6YTpsmUtUuE1z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaOmjGV/; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaOmjGV/"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3870df2331aso72461681fa.1
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 18:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772765469; cv=none;
        d=google.com; s=arc-20240605;
        b=kKBeOZU8TtOIMc7Y2TMSlh/8LXo74FZmzYFZyFJbM2uoUfe2Y0gobfizrcVZLhMYzI
         DU2pPKxtkJxCGVYBKsh3ZWBuydqB7NHEdmGkMkcLL2josG0BAjj/gcsHOW30Mw41boQ2
         8AdofKII3Ew2+hAjkZ77XC5gLcSs+CEunG7b4mc/Dh+CZJPedlo0bk2RONlP/ArNWyIW
         pBG7lKoSsViXoBfcNeCJnRCbzX+7lvRtiFBLGW3XS0ErSVB5sg0omLTsqBLlBSBydW+6
         UVVsvDauuQapDVhcAQ1thlZ0i/IH2MT5tOz1LcuR/KoXfCdrzGuHQmtveUOOnISZ3a4o
         A9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=;
        fh=2hZ2dGawd+DHXSD5UeSsfX0xsIoQnGuwiUBerONlwhA=;
        b=UM5x2oSF9+mBS4s/tr+lO0wRfMfBGkDujPbma8Z2USHEoO9x5Ha4gH1oQEHa3q6VYt
         b1nQ7F+rDXKWyswzvwHLt5pF0QN6gesJZMvgAZZeWVxufqW/flMmURe6FX2quNhb7YnX
         Aee4mFcmd3ivdvjWchS/ATph/XYvBTbQNLHQVVrPnoXqpIZPH5ufu8hyxyLp08moWYgb
         Y7AQdcYVy0JoOMnS1yHkCbvW0aA+nSVIfQss6hHi4hD9JTuKFZp5X2Xtkku3ECYnhUBb
         nYebwh9v9Fkx4Xi+erwL0RLbHRuMkyA+AU2CpalkB6EwMte33STC2fSOZdR//FSlfggp
         moYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772765469; x=1773370269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=;
        b=gaOmjGV/MnvegMQD43mTuN/tEvcrsygWtZ2F6HcvIctPdB/3LGd5sSytzCJfQURBmJ
         Qdz+hJEg9h78MtBQiNfp/Xf5+WytzDbiE7NR/20JF6yJeIEgiBXzSnp/P7pK5lq2Zoou
         2YUa9OgAdQTIqUfCsBWVfpf0T07yzZmWEqnHIuBuSOGksRKBMhBkBxS//dgvwHq7/cYy
         IEEhyl50PxLsi/C3iIzEMQ6VT+Z3FEZYoxTyS3PEY3teev13aFRjK66WPmXzCAJcUKhu
         xFUyCCPTljaY94be7nNXz7+ogWrMWWBb/4k+RQ0i18e0uIEjuqujpscJkaOrmYv+r1tq
         GMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772765469; x=1773370269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=;
        b=YTjXWKrPeueeykueJzLM6qBlcZh/RVY/Psated87gRc5u/GhgqP2CWbDXmYz6SaIU9
         BsibnRcO+rT1+1MOtcvmKy4dJ0GftqksaeG+rRCBrG8w4uRT8xQeruiN/2TQv2Azlomh
         B3y+c10iwB/8jGsrtiODb751+OWEk3rAVqZvxXF/JDqitBbjWzTZTtR9xS5enccY2IDn
         JmUuB2/cMfCcS7DKBlD17lP+sQCA2SfI7uN7LgLtZfqq595tk+xzovHouGSqVORl8e4L
         JgGcKtI49c528/qKr6qhajGhQ22xp4FEwFUoj6wV6ixN/H1g7A63MJgijMIiRtes5FiL
         1jCQ==
X-Gm-Message-State: AOJu0YzA6OfvA0L/wTMl/b5xypPVm1CGiosrZ6VA4w4Pzwv1SHT7r5Fk
	Ud+bXI4CFffLZIIlclgrYEK33O1CErx8nVFxgDpGCnj30BH9nTPpHgYeUdv0ZRO55cEIfvA9JxM
	u+AO8WBW9UH9rsCiu3zP4Ze2zbHbfSWE=
X-Gm-Gg: ATEYQzxYuXeGlqxwAF6NH/dR4HMrWRExLm8u/Fh5Zz140CK2NWzosNdn9AF42jS/Jkb
	/frJfHPYj8YIDBqMxFC6wqByIyQQ4m/bEPUTgm+5IR+ODc3U1/08KDVH+u59Ln9xTwaq5oqWdyT
	4NaqEf3gpdxGGInFrzXJUCc0LQdG6RVLmvKZmHNGcd76PsTmyEqUHiVoDXGfU7gchzyOTKF8OVs
	EVki6Bh83hki3BvwL0pWR3tgwYGTzCI5qYhVjIS9rpXvbYEK+lHKdGHBH7Hen/JSYCwbTegIfH+
	+k0PCVgUMX2/kE6C6/x1ucGAc4oLBYc9caQ356uDAKTrDQr8LoBtpD1pzbV3ClBj7EIGmQ5q
X-Received: by 2002:a05:651c:620:b0:389:df67:64ef with SMTP id
 38308e7fff4ca-38a352a4a0amr11338661fa.20.1772765469411; Thu, 05 Mar 2026
 18:51:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306022406.760-1-ming.qian@oss.nxp.com> <CAOMZO5BP2aLD+a1r7hVd3F4Qvfovxb8PgQfzcVRKknBHWYBmtg@mail.gmail.com>
 <61e260e0-4544-4c51-99bf-c4815367fa94@oss.nxp.com>
In-Reply-To: <61e260e0-4544-4c51-99bf-c4815367fa94@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Mar 2026 23:50:58 -0300
X-Gm-Features: AaiRm52ueFUXaqQfpowdXyDTPs2aKgG6aHElJW7IWO6H3_-P9HAhh7hH09TPm6U
Message-ID: <CAOMZO5AYRWBykSdvogO0Ea6JidjgY_h5drnBpcDNFrU_oo_L2Q@mail.gmail.com>
Subject: Re: [PATCH v3] media: verisilicon: Fix kernel panic due to
 __initconst misuse
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, ulf.hansson@linaro.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, m.felsch@pengutronix.de, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 11:47=E2=80=AFPM Ming Qian(OSS) <ming.qian@oss.nxp.c=
om> wrote:

> > Drop this change. It is unrelated.
>
> But without this, the checkpatch.pl will report error:

Please do this in a separate patch.

The goal of this one is to fix the kernel panic. Don't mix other
changes with it.
