Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180C1368D46
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163655; cv=none; b=H8oM+m/ufbY76HHtpA/px6cxDWbPRcHnS+j3PrmKbpYj+28NDtdOax/ySh1J3aRt0QeT6xrFYw0TFVvgA4lprAdqmoLLRQ45JBTE5X9EP1bkoQQ/t65Jh0hzvaM2arDP0CWB2T+8Vzz5sO4UWyaittpJq+PxyosROoXLRnZGhA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163655; c=relaxed/simple;
	bh=0QW3brAaI/TE7UXaiy4p3j3Qo4pWIVq/TXGmiGD1pb8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=CBeHy/YUtN8wAXudDRkpahN3UEAPMZg+9Rs9IxPiQGrfkF7e4oSQQrlzNKBQyXFL+ekj8POZuBvX3r46py9QV/lNiXVEqcMJmH/ge5+cMdycL0g1X2aEnmsm39rYLmn3EYdWUQMV+yOcSOX1+nqdfVTBRizlnXiRzV1apvlkDpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OM7MCb3L; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OM7MCb3L"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6913fb25322so7182467a12.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 00:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781163652; x=1781768452; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac4jiWO7qGzODHYdUaXq5mQJG2QTT2zWwIpoN1/P2z4=;
        b=OM7MCb3LI5SCsjad9zNnXHpKPHIfIxYMoql9ZaK4SC/V9m9v7xpc260sIiXI3kmJv8
         vfA98Tjx6dPCDSTOZwVJ11iDDB7VMXKSKRxVexec/mJnQREw1v45AIf8TpALtyYwlHw2
         /6NqIfJ0Zm/HyzOjtIYjqrwybnAZCxZpKDysCfzws1BaK+MICD5SIdqMeXUCySMY7OfQ
         Ca8zqpnT750IJQ9BG56HP3qtsIsMZpLuqS39XLqP2BYbs0+AlDKgK5qmFA/0NiHS96al
         JaJGU7RlCRHrViVBFRgLUtIsvxPR0G14aWG7xWUeDlYXTs1ITeaerW1i0JLutJXawezM
         vZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781163652; x=1781768452;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ac4jiWO7qGzODHYdUaXq5mQJG2QTT2zWwIpoN1/P2z4=;
        b=s4XvSv60fa9/EPAMtFiM85n49cVvMyoUg5MyuguY09kvcRi0WlxEyjcHtAKNdNTmPF
         EMFccAlqw3utVQE+ZjMRYyxxC0pMf4rylYnYBJFdaO6jvWzsXun9Tqw1Zn0rvz0UzeDX
         qPMK1MSntlCI2JkHE2fjryYVIKuCtnROwoId2/puhjINwRvlNfE0JEUXxEtu3jDHvx2Y
         qTBu1VJf66+gx6CWJ5E6xabc0B4yBxy4G6S1ay9+EERt6fA6/QclF0Je4oAUNfJCzNvh
         1OyWR6FAGv8OF60K5hwXdW78BjPjUFDHesag9nJPldq2+9kmjBCP3HJ2KA1YRu5T1sQy
         W5uQ==
X-Gm-Message-State: AOJu0Yzp+sfhEJrd7rtSXaZATfrOLFWauixrxHxk5iyis2is8k0KnbaT
	njUCF33GRnyP56zBSDJgUew9nRnwnCw9JpCnsqDre6VSMTJkA262ELHJ
X-Gm-Gg: Acq92OGmZWZrk85bvDjZnjmgRPrxU9iAKPgT1KGDyjCWmnfybg3lLkA/Y+nUws4AApd
	ol75lhTWW0CPBqCCFO8K80KcUmG1DX4djCv+sxBKjL16BehWCAvmOm30XLg2BR0yJECMDZOT4Nv
	JpL8B8qe2BRE3QxNWxPyGcQI5G8tzbwIjyCmzo/Bgu7fsmwU7Jrg2geg6BplaujEu05PuwbzDTH
	TUk1dojK4y/3S9oOuLmXSPodliCxQt/HpITDoXD5v3GsrAnkMvsGuqGxE1pe+Ht1ZHKDVc9d4EY
	MFhHr6WSrzrDsvhlQSbDTgmU0YeFZFiPxrEc0pR5wwrszdi/OyqhChniwSOtDbkpizgAWEkaI68
	8MItVPgTWu5hd4lSfNJt3fMssvaJTvhc/YOM9HQbx8nr9pXJtVGMPOcDFnsdB9Wq037gyQHeSRd
	fiEF+dzAYnkurc+JXfoIqiEoPdsvpLbBZtAU4FTMhS7FJMGYmlnFDg3LhkGjbob9FybjMUcoeaF
	E8Mpo26StstLVt88uwO
X-Received: by 2002:a17:907:9726:b0:bd5:1482:930a with SMTP id a640c23a62f3a-bfc87bfca4emr70689766b.39.1781163652094;
        Thu, 11 Jun 2026 00:40:52 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14315sm23828666b.10.2026.06.11.00.40.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:40:51 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <1f178828-2cba-4120-bc6d-bb3be7b24073@symple.nz>
Date: Thu, 11 Jun 2026 09:40:40 +0200
Cc: linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8673B89B-0F1F-400D-BD0B-31FC1647167A@gmail.com>
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
 <5939C396-3A70-458F-8E6B-A55319929564@gmail.com>
 <4b3a9f32-807a-4b9e-8df2-d22f872d288e@symple.nz>
 <2CB1844A-3DB7-4973-98E0-0C141DD38B45@gmail.com>
 <1f178828-2cba-4120-bc6d-bb3be7b24073@symple.nz>
To: Simon Wright <simon@symple.nz>
X-Mailer: Apple Mail (2.3864.600.51.1.1)



> Wiadomo=C5=9B=C4=87 napisana przez Simon Wright <simon@symple.nz> w =
dniu 11 cze 2026, o godz. 08:15:
>=20
> Hi Piotr,
>=20
> Short version: the in-tree port didn't actually have the warmup =
running (it needs a
> probe-time buffer alloc + a pm_runtime_resume hook, not just the =
decode code). Rather
> than pick that apart, here's a clean patch that wires it properly - =
and I've now
> validated it on hardware.

Happy to hear that.
(I was afraid your excellent work will not solve my issue=E2=80=A6)

>=20
> The patch is self-contained and needs no devicetree change (mainline =
already maps the
> "link" register bank it uses); git apply-clean on 7.0 and 7.1-rc7:
>=20
>=20
>    dmesg | grep -i "deblock-priming"
>    # expect: "RK3576 H.264 deblock-priming workaround enabled"
>=20

Im seeing this so all good.

> I validated it on the two RK3576 boards here: on a NanoPi R76S the =
warmup takes BBB
> from ~18% of decodes corrupt to 0/40; on an ArmSoM Sige5 the unpatched =
HW decode is
> 100% corrupt, and the corruption looks exactly like the photo you =
shared. Before/after
> captures:

Pls give me few days - I ask test users to give daily usage test runs to =
make sure users will be happy
(So far my short lab tests showing all good)

Simon: fantastic work!


