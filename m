Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB7044213A
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832710; cv=pass; b=daNKGwrAlfMXXFkgOXTPZ9KH09L7ICWVroDLH4nwG/69k1wjPtx7T41JTR1HvQDWp9kNjdYsp6SoFzDRJVGQRUCqOzW8ge60ssJOROEYoJb26m8T2ZmNsoe9pIOGJC2kqilbb7zuCMRbZWN5JMSD7mNyGK4H06nIs4KB9WjCJbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832710; c=relaxed/simple;
	bh=e9TCua0cxE+nGZWodbf1ao1GB6SwUtZmJTt29jQl3Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLucdARZOmYia+Wmti60KY+QvpbV0zvVW9DfabDdPrbo+9V1n4yJLuRws7p2Bpet1b9jAD/cJNCEvUuGV7UbS7CoLTYXEgei+Ta6ybBKbCd9RqwA7X+yVUiQdGVq1WLLNS44awdEPbrMmD0PfGgeX02qoaRwCiVSZX9JX1nSvFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6jVvIXJ; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6jVvIXJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso5589775a12.3
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 01:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785832705; cv=none;
        d=google.com; s=arc-20260327;
        b=cCSiga9syEbF3OFdqtkSccRucJQmkyLyQOqJRI7z6K7OAltwaf+YsPvr320Dt99SAc
         /3Zf+wHWwc0NgQp81qAS4VRJ4l2GXEG06TeWbdGecqvK8CmfOg0H/ILZrlWW0lYX+IcX
         zHDToBbyaQB7QUullSvsPlPeRADUn1NgUYpcI7DpjRkCkbNP5j5v4/kqErguHFa/tuaY
         lEboVLO8dG4sKGbw6YmCYVzhMjJsAkKOWrD7ppKsZM1HtO/PcL1PEB6FTLJ19ztq7/Bf
         HLpsPzFOM+aP5QP/ANB2zZfvQFynN6HaLh/vRz9k/jzQSzRYRobQ//T69OcTRR/H44Ty
         dQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3jSClShH7LFBWTNoFiWGQfRs7wED7dYbvjLTLylZdJg=;
        fh=f3mxTZ7gyPD1GSHqrxw7IJjHQf29141pU70YqBONPpY=;
        b=UGPkwzvyZU5FNSq7Mh9HTsOy48wOOYiYSB1lEgXF+mOsXEm3lZm3KYL7NyRM0U61QA
         ZndMUceJWe49Mtqnffj9beZCcJEokjxyT6igvYH7ElwaH/+eOTe+9VHJ0TM1kiY/ToVz
         BPZDjtHZc74SXNLFNBfv6BfosL0uRU9n/q4pJvQWcGNauL+1/c8A65fBsUaeKLZl/qJ9
         DcvPpowmpYIo0oin3AD9j3kwObXxY30qI1F23ry7hkDJM0Qxjy/VO8XqDoXM37vyHJ9e
         cWEzkjT/g6J3dekHmA6NP54ON3aT7eQyRJ63rjPym8CB92q/Bw3/XRrcrXuJOiq2jIa3
         b2Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785832705; x=1786437505; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jSClShH7LFBWTNoFiWGQfRs7wED7dYbvjLTLylZdJg=;
        b=l6jVvIXJTMqwdxvSdeOoAcui8I6YR36/Xpa25ipeENSfMXIkp1YsbghUWNlkEYUy6F
         TzowJg7/QJfeE16SX2lGHyIC6hDB8B965dUx2sb7dfSD1s+IF7lXRn7uiyXOLNC+yrX7
         zshc9MZ14q2o9XlIUU3VCAU9S3SIYKHj5IVHpBZRSZg7Mh7V77n8/vsKDwObeinGPyB8
         fxNXNh0dZxr0ptoLYvBSp5Odqle5smVq1rmTjRZvqbKJfukvHM6vC2BUlhGBLvm9WJcE
         fO7M2A3eSwKPUc6bMhZH7yodN+2+211uiBR3Y0rsgJdPUrkz/jW51I+60W5+YAEGz1dg
         Eb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785832705; x=1786437505;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3jSClShH7LFBWTNoFiWGQfRs7wED7dYbvjLTLylZdJg=;
        b=WRr2JoOUXAKWH4yslHyCXcV3GUocMMtuEqknrGdCXYIBGysLX0DePPIzk803FIZzgF
         UITzosw5n9q861dRbbXTbLTcumSBR7U5bDdk7i6KpwIttpCRW8gEvQDZU/BU8fhOWJP9
         QFfapqDTtGu8lLRzJVOBxPTGPkks6uWIE0rFkxm5KbEpQ5KfrkQJTDRPFPz1/RchKnlm
         61XbRNVuP/VhJEn+LQo+7gorianT4KOoNfUO4KrBKU8M3U9/QqjiZB8pzHcxOfeXRBnl
         uURbHxWJdykaiAR8/IK8wV8uUcTUTUSs1GzsQYu44ucr1jou3qA1woE53kucD6oTPj6s
         DobA==
X-Gm-Message-State: AOJu0Yw24cH588MjmtVaoi10e0mXdo8ZC392+Py7ApIFJYa4jlABL1Oh
	i597KBBvDceCP+LzwFjzFCjxL38eDh7oxqTKC1CB0CoXr6kJ2FOkANB17Ntwh5RnA4Ukf5Oqzvj
	+kbNQ4Mo+UFGUs/rFVOHyE0/poZctL1M=
X-Gm-Gg: AR+sD10JHR9TA/F9K13V+jrnkk6KsPL+3pseUSM7+gu2NQFHi5cX+slAydfH6fxqTzX
	FwKQa6G6wuQm/DJa48dvkkG0Lz8cky1qxIJbi9Q2YuZIvLG1G2HTsiGPUlczud8deTdUylAcoEV
	IZ+eAl8cJ1hVZ/SEUGxmsGDcDU+9E7MFj+jYRn7/KVbtZDAQU39FztbPeHVIs0UJjdMh7c+Y5Wn
	ti61ncMXdaNrPcv5Zeq7N+h8JCqOdNLmRmRyfhridLrBvHjM9i/rn0QpBfHBjJkP2vGWXd0tRdb
	22oaQ7xhusY68Zw7cITDiPbx92dQCJlttdJiM1M2JK7xaP+zHZxyia3W3906YGzgEh/iqFcdQEO
	MpLtxd9gW7aQCS8COGtTAPGaf+4v1Luv0HX0=
X-Received: by 2002:a05:6402:a0cb:b0:698:c14b:a719 with SMTP id
 4fb4d7f45d1cf-6a0a7cf8d06mr11349073a12.20.1785832704696; Tue, 04 Aug 2026
 01:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804021735.345039-1-j@metarealtyinc.ca>
In-Reply-To: <20260804021735.345039-1-j@metarealtyinc.ca>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Tue, 4 Aug 2026 14:08:13 +0530
X-Gm-Features: AUfX_mzNdE1rruK2Z3CGIYwJP6W6_dKHHpKFZx_yX4Xwu9NTsC8NdF-W6MB0q0Y
Message-ID: <CAJTcUFT+x-QXZo=MUDK6Zcd4PoridP_M3aXM=YWXcgE0aVQCdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add Himax HM1092 image sensor driver
To: Jake S <j@metarealtyinc.ca>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jake,

Thanks for the detailed review and for confirming the Intel-side behaviour.

Good to know that ipu bridge  The latest publicly posted HM1092 series
is v6, so I prefer to address
the Intel support in v7 rather than defer it to a follow-up.

Could you send the ACPI match, complete Dell 648x368 register sequence
and the 19.2 MHz/180.48 MHz configuration as a patch on top of v6? I
will fold it into v7 and send the integrated driver back to you for
testing before posting it.

For configuration selection, I propose matching the actual input clock
and an endpoint link frequency as a pair. The driver can obtain the
input clock through devm_v4l2_sensor_clk_get()
and clk_get_rate() 24 MHz from DT on the ASUS and 19.2 MHz from
INT3472 on the Dell and obtain the permitted link frequencies from the
DT or ipu-bridge endpoint. Driver-owned profiles
would then select the corresponding mode and PLL programming:

- 24 MHz EXTCLK, 180 MHz link frequency, ASUS 560x360 mode
- 19.2 MHz EXTCLK, 180.48 MHz link frequency, Dell 648x368 mode

This avoids relying on DMI data or on the ordering of the two
frequencies advertised by ipu-bridge.

I will also make the exposure comment explicit: the default of 500 is
intentional because it matches the value programmed at 0x0202/0x0203
by the initialization sequence.

The control implementation is based substantially on your register
analysis and implementation notes, so I agree that Co-developed-by is
appropriate. I will include:

Co-developed-by: Jake Steinman j@metarealtyinc.ca (j@metarealtyinc.ca)
Signed-off-by: Jake Steinman j@metarealtyinc.ca (j@metarealtyinc.ca)
Assisted-by: Claude:claude-opus-5

and retain the links documenting the register-analysis provenance.

Regards,
Ramshouriesh
