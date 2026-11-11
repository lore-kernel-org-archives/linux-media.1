Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395377;
	b=yK0efNEM8STY/ZdBGB062qZxxMXAZP6X8l8otsqLFIG2WmYaifxhEh/i2SBSZAeq4fIw
	 f3lquOSjSyihhiNHOkVk4c7gcKs2gIfx4GY5RZytC0vA5TH5RIg5O0PaRygRhvn5ZUMHA
	 hNjvn02uuYB69izP4Y6GPydPH/yS0IoBj664MNyelPauiaWD9wjfyKe/xZHpyksadFueb
	 9MubK5XrXWOPER4xsHF2VzfDHeWwCCK/4Q9JU3h9nWuxivPYoExXd1PWmoS4qXzuglGzA
	 qICNUJhagwUkDby24hbEhxtTSSv611oFgi+o0BGNfnMPJRikE4mLtvYvhNTKfcABmfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395377;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yn5y2q3JJulnHdFFu2RjD/z39f48yWR7C6Zxb/M775M=;
	b=mCuoN9CIA9oGqOeFi/ksR5J9W1BT5mmO+FeacYN9bDJP3uUMuHxK4iRsp2HVM7ODgmH1
	 CzoS0GUFxyfg6R9EEUmRS0neju2O9MSWWQjKNjZ/9bZ1qyX6IHQdfIX3pTT6e6oThuhmy
	 5q4YfQC640/2b/Ff+T1o8IXaGNPtai8OSNPaY37KlXk1O/GaiTJR5q5U9AvD7Li9j4JlX
	 YFKau64JMUji3GgZ74iUT/CGZ4tpmLa34h8yJfTcqgakdKQoHkNdWajkm0OuJjwzpcs7L
	 OVxjBZ5jWVUMM9mUK9ACcft4t0BJ0pVdoU1CRbeuPm2zf+eD49KhW96SduMnOVnsCwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18E1606A331
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 11:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F18E1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eac01ff101so1071214e0c.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 03:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395376; x=1795000176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yn5y2q3JJulnHdFFu2RjD/z39f48yWR7C6Zxb/M775M=;
        b=H+wynvP5deDvwgg6zmgBBr+1AxTSEt01OOQAk0OgqvWwMt/hgvaW9pklWSD82B+/HC
         V0jhBr3K1pIt46QzKv9PNjEZH8QyY6AJgeJElC1E8muafFhXJ3iZageYppkuJKhI3863
         bKNT1IwFNY1Ohhjd9jj/LKVTNXNCGGumycJNu6XValwk6Gln9sRWwpPsyG5Ft0Irkx2q
         wW8PH60FoGOo6Euwvs87Dw1nWWZLkG0PGsNoPkuv5vV06G1r9faXXUfzNDCMmy/Q6yvY
         VL1mrnK0nA4Wh91kGpPc5CnLFtJyQ/qRkND7fH7k2CEJ5JRiNTAnWzyAZU2Vt6R/FBLN
         9oJw==
X-Forwarded-Encrypted: i=1; AL+hErFCXJdUZXr4nK4hHuR/VlfCQUhaqmVU21daGDUtS7/lvctVAoAkxsL5hHRQSmnc6nHB91xxc+WeJpmzLw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+8HEhN/7PPFoJA301/loptEX9fwodn0jrgyfwFWzSTWgHxqYrf
	ppIGxs4EhVAtHBu9N1in0zM5J1EwM3xsQBL4ekGQ0NqN38KbuFnssOjIiVC7/dc7mkk=
X-Gm-Gg: AYBFou0BWVoDCVwiuY1gba0HR86Q7HKpHq+LHW7jkoTTCDeN10i2t1ErYijVmLzOJCt
	QXptn8jENqGBMt8319xzDq7bS2tcMEt0Zijs2VVRaLjYXorLiXqGdvEGcijmS+nPmPTegUqwdks
	a9uyARsD6OhsPML1SqDykVUsncDxGlLaA7Fn+7KcYHPIsARD8TKnpjzyWrr06P2AZLqbyNQhlEz
	IwR+tpiXUHkaVcI0K8Lh9AoMGF9h7s5vRFmAqDh2fiho1IMJ1FDeW5WYF1W269yFIkl48hWj4JC
	lBzTH7aRNt4DZ1/tHUTBgd7hHDx36yXqk4M8U0VQxD3TdVlQ/y7D/JdXfr1EaBXrTBtdjqTkD+v
	SHD8zXGqDgml8zS7od3feyr0ZCPKbhbRGHguAuEZ/tx4SWGxgn4juwkldnlgdfBWGxnLl119KMD
	kSbOA1x0lsJJUWmFGJ0t8gsF89rFfkE3lqT2rixiKzOp+yva1nKS46xKoWqfEno55dQ/yfry0bS
	dgYBwNQ6PmzHuxJWiv7rIm4iOCG+CcABkUJV5nnzVEJYMkD3dlxQQB2KQuYueFh8/7nxdYt9ATF
	bYy8pHPk2lNCuiVppdAbb+Pgdn2plwRRq0EL3MXE3y2btjY6e7BvCZhoUsCVRrf328SnMgURiMh
	dDU+IYSvTC0Bg
X-Received: by 2002:a05:6102:3f44:b0:7b5:7cd5:2a1b with SMTP id ada2fe7eead31-7d4fb250760mr454754137.10.1794395375796;
        Wed, 11 Nov 2026 03:09:35 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d302334eb6sm3691523137.3.2026.11.11.03.09.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:09:35 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-98c7798ce74so805473241.1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 03:09:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE87Puioebr4Pg02Fe1AioypB7GL0iPQ0DK21lH60rvktivBhqZfxa5TjchU1qi4GLZPk9vVksySajrWQ==@vger.kernel.org
X-Received: by 2002:a05:6102:d8e:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d4fb291ba2mr478980137.14.1794395373576; Wed, 11 Nov 2026
 03:09:33 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-1-1b2072e8c37e@ideasonboard.com>
 <20261110-steady-kangaroo-of-mastery-5fcd7f@quoll> <179438844820.272237.18262716067322018404@neptunite.rasen.tech>
 <e179b228-3f18-4b99-9c54-93699d13e63b@kernel.org>
In-Reply-To: <e179b228-3f18-4b99-9c54-93699d13e63b@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Nov 2026 12:09:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQOMX2GXnBpH=onofFp1w+TyZPNc3RWjM1pDbpLTG1fA@mail.gmail.com>
X-Gm-Features: AclHuK-p812fgpXzcAZTo074hP5s29t5onlgPposQZBLZQWezlnyhodp5CVCArI
Message-ID: <CAMuHMdXQOMX2GXnBpH=onofFp1w+TyZPNc3RWjM1pDbpLTG1fA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] dt-bindings: clock: renesas,r8a78000-cpg: Add CPG_SGDn_VIO_DP_{TX,OTHER}
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Elder <paul.elder@ideasonboard.com>, 
	Paul Elder <paul.elder+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2026 at 10:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 11/11/2026 10:14, Paul Elder wrote:
> > Quoting Krzysztof Kozlowski (2026-11-10 18:30:50)
> >> On Mon, Nov 09, 2026 at 10:34:22PM +0900, Paul Elder wrote:
> >>> Add the CPG_SGDn_VIO_DP_TX and CPG_SGDn_VIO_DP_OTHER clocks that are
> >>> used by FCPV, VSP, VCON, and DPTX cores.
> >>>
> >>> It should be noted that there is likely a discrepancy regarding the
> >>> clocks. In practice it ought not to be an issue as all the clocks der=
ive
> >>> from the same SGD1_VIO_MAIN clock and none of them are programmable o=
r
> >>> gateable.
> >>>
> >>> According to the datasheet, the FCPV[BID] and VSPD cores use
> >>> SGD*_VIO_DP_TX=CF=86 while the VSP[BI] cores use SGD*_VIO_DP_OTHER=CF=
=86.
> >>> However, educated guessing suggests that IP cores in the same pipelin=
e
> >>> should be using the same clocks:
> >>> - FCPV[BI] -> VSP[BI]:                  SGD*_VIO_DP_OTHER=CF=86
> >>> - FCPVD -> VSPD -> VCON -> DPTX:        SGD*_VIO_DP_TX=CF=86
> >>>
> >>> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> >>>
> >>> ---
> >>> Changes in v4:
> >>> - Add all the clocks
> >>> - remove DNI
> >>
> >> What is DNI?
> >
> > Do not integrate. Most of the patches here were DNI in previous version=
s
> > because they depended on a lot of downstream things, but now those depe=
ndencies
> > are in the process of upstreaming so these can graduate from DNI status=
.
>
> Upstream clock indices ABI does not depend on downstream at all, so
> seeing this unmergeable is just confusing.

In case of the clock indices, "work in progress" would be a better
wording than "downstream": multiple patch series are adding indices
in parallel, so some of them may need to be renumbered. Just like when
adding syscalls.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
