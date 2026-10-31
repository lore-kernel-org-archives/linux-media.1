Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793432886;
	b=5ZNvCCTIrYxn+SJTAgC+QtKmR96hxTXiPYeCtao7BFLstBfw+lDB50TpdIGKrdvO4Beo
	 ezG5S6pAp4jB9xNVev/xlZYK8iseyrNY3ZRRCT1qSNxhH47xrCyC1P4UJuZF3RxJUQBSn
	 fHtH/Tmb5qX6eMDWB3RmaR5WrG1993mFcTtjGaOCy1Vb/Oohl4hS8qBs7W8tIS0NLWldG
	 HI6YWJ4xW7Kz3gaT79hAOBB+xnJcxRCAqeh64QKCwjGLNhS9zPYR1ArpgIZJoJzP7eSkj
	 Vrvw/xCjxDT+LPoPWsqVDUwr334xmJpdHk1ZRb8p7eEDOJEUW/44ARksSLtz6CI/6uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793432886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=74V1NBIGjJhQuSUk1h4e3xvSxs7OjlFC+hpsJiBGmnM=;
	b=WRIyoN0BLDboov0zNYYeYuGfjjMUNrPN7h+BvZoK0GLZxlV0dDeDAP2GG5TU6rYeB84t
	 QJOVXpWJXS1Ne8klwfK7erpNCbBtkyRb6ku8qZOUenykseGnjXD0aVZvnZUsqNWRYYTjm
	 O7X730ZsNOPc+e+VXpJFrF7QUwz7K5WzB21UOK8WfmNJNCjAzC7QRZC5Jwk49A2g7jTC+
	 j6f0zDIfhErNfSeNHpaWnrENw/9A76z3ppopF+i2cjiyNclS1DdR/hDBTvf9csBnY7MqX
	 CytEuZwPPwgZDmNvr9zW58i91CAy6cabfAkOL0eLLunEqU80G91aMwqdKCjawsNu7kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=UGq62yiA;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31F3606A31C
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 07:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=UGq62yiA
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso1852754a12.0
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 00:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793432883; x=1794037683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74V1NBIGjJhQuSUk1h4e3xvSxs7OjlFC+hpsJiBGmnM=;
        b=UGq62yiAsCHbZ2NlaDbor4G+IWiwn6vRFyj+sHuuVA39qNZkdJe2rwZ40MRsjUp5gg
         0vTZzjodRGNv9RYr/oQkNGdOI9zRr9qHmlSjQHrgyeg5ZtB4OPZXCtZg904OxZt1fiIr
         OeHwh65HO3Epfz8J1veNj7jLg1hbUf0sOhUmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793432883; x=1794037683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74V1NBIGjJhQuSUk1h4e3xvSxs7OjlFC+hpsJiBGmnM=;
        b=IXjgx1s9NYW8xBeAhPEI/zZhTvaWaN3B7zt4d1RJvZjqeuuACt4mXbNaL6UaY446hj
         E/1BicwW1P9aJKR7awH2Ekz6JJZz3OrcOI+nNs6HDXfjPu0uRf4Z7oOaGkVHarcmoRJ7
         LncOY9tq09Pj12uuKnSLSVtwsCAC/rTKZ0dTp5/kn2LTkqFEU/0IiOxauOniIqEFkMaP
         pFehbU+ksiBkgvLXIBvR/BDpbLPqT7o2vz79rJUWllJZXZwzob9fZpfjwxsYiM0uGSmI
         joNGbPAuNEOaPdGPfLh5U7ZpQKDzsg7ZaPpREQsY64ZXIOLqWXvQetwpGLhNrkGPsAvA
         oD0Q==
X-Forwarded-Encrypted: i=1; AKwUvByedGJeCMPdSKpj2Fg7Nas4PhKb09xXqqzlglYFwZLyTH3HFDqe2aln5XoZDkAY4mx5K9AUBZq2NdRa9Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKj31S/4KYhZt/NVjNSNEy+eA2tSbRT4edSeApK8CL6LJtKzzJF
	q/Z6L2O/SySXi0MArOQ1UcLcHPhE5Mn1A8ElbpMC5WoMeYht1cVazfoU4RlgS0l+ZgPfcWnKf1D
	ihRe6qxU=
X-Gm-Gg: AYBFou2ISS+nuUxFLzAYE6XqKn7wSMpqpplc9RyDDTvQm3Gqfs6PEdcTYAy2QDR+veC
	hiJ8zP5IItZvBqo3BnQ880oOjWBV5EMd4A7dUKBsCBOo8weuPM/ZX1t/ssmpUAgqdlsL8gED12s
	Q0AmEZP3o2piFgVaeAmQQ6rg9OL5RRAq5iktAqGDqiaSwxlfaUOinVtquPzrgqcxlui2bhZcwLm
	e6j/wJfpWSaJ0mL/mbCVjwLLvXc36pEWxVtheRFYoHKCKCq3wYi5Ph2UIZQSB3GfTcloLG+5LrU
	f+abYzgvPP+imCpzH/5zydYAfFCk3Tt3oD4uJSwr8WkltzkC0E270T5d9ca1IUQd+xOwqyt5eeN
	noTmOij24F9uj91QVxcHN+l0kkQ8aTZUzZEQKc/CanM2JQqFiCUgQyAVcQvGra4sqjOi70Wpj0G
	LFhdRTfI8Mu5rpnpal/1eDZ558zxyr1hxxmrRGbqYrcJGg4qToDRmI+FaSyrld9tjeICrnDDC8X
	5NJF/nI4nHETK2XXj8meMeZmnuGo2QJofbSt9W3g9VHFHUU87fCW9+hJkRfH943K/W5SV2eaLzO
	OXbz4WOn+cgegwaTzhYaH3uGx6kkz0TWC344ZjNR8b2M1gXpMGJF7EC7iHmB7tkpEqvYIZNTftS
	ai/E=
X-Received: by 2002:aa7:de1a:0:b0:6b4:1037:2b6b with SMTP id 4fb4d7f45d1cf-6b4d6892a9fmr2075426a12.45.1793432883138;
        Sat, 31 Oct 2026 00:48:03 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9a7d59sm770599a12.2.2026.10.31.00.48.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 00:48:02 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e8c710847so207888266b.0
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 00:48:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwabyo0m5VObp+ltL/So+HJo6o7/Xo09evd/p6Wco6H/cF5XxkKZkVvKhBilNiJRoT2HY/h5KO5vDLQ/A==@vger.kernel.org
X-Received: by 2002:a17:907:9693:b0:c49:ca4f:ede6 with SMTP id
 a640c23a62f3a-c4ca792e78bmr375730066b.2.1793432881922; Sat, 31 Oct 2026
 00:48:01 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024185058.20410953@foz.lan> <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
In-Reply-To: <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 31 Oct 2026 00:47:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com>
X-Gm-Features: AclHuK-PoafTkfrw-_O-xG5p4dHxh4twzZ1rG1r_WKPFt1VL68cMWA8bARoVDr4
Message-ID: <CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] media updates
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2026 at 10:34, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 24 Oct 2026 at 06:51, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > Sakari Ailus (60):
> >       media: Don't hide I=C2=B2C or SPI drivers by default
>
> This needs to be fixed some way.

Btw, there's something else *seriously* wrong with the whole media
tree in a more fundamental way.

The commit dates on those things are pure garbage, and all over the map.

Look at this:

  $ git show -q --pretty=3D'%h %cd %cn' --date=3Dlocal 0d2ca6403186 0d2ca64=
03186^
  0d2ca6403186 Tue Sep 15 03:01:28 2026 Sakari Ailus
  63c578491cb4 Wed Sep 16 14:09:38 2026 Sakari Ailus

what that shows is that the commit date of Sakari's commit
0d2ca6403186 is *before* the commit date of its parent.

That is impossible.

Unless somebody is playing games with rewriting commit dates or has a
completely broken machine with dates that are several *days* off,
because there are 11 commits like this, and the worst is off by three
days.

Sakari Ailus is commonly - but not always - involved. There's a commit
sequence by Bryan O'Donoghue where the parent commit is three hours in
the future from its child.

Time doesn't go backwards. And if you have three hours time difference
(or three *days*) between different machines, you need to fix your
machines.

And if people are playing games with commit dates, they need to stop
doing that. NOW. Because I'm not pulling the media tree until this is
dealt with.

                 Linus
