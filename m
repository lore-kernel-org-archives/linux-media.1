Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CA84CEE57
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 11:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545145; cv=pass; b=JMF+oi/5q/4/oynfKDIeLZJbZOx8Geu5vmH1CBai03HvSP0utYGa3m1EygcqnEvbkwvr+i5lOW9YqPXt0PVMMwVhUnWceIEkrQDZvwKN2/SeKxDQ+QOIwy3KL8IFn8iEHLT7LaioYVPmeS8TJFZ4kdo5mkl/fv6Nv+AzP/xqL04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545145; c=relaxed/simple;
	bh=d7o1SP4cBLZfmsCy5n0pJ/x3+gBtBwJW8TYrSwMF0g8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByIfYN2gNP6B0iQLsUWDdlYRRVCR/OwqjPvUbHMjCe2sufQirbHkzLw/3FVonMhiPJPDe5OAYO6ZKO+7XltAnBfFhR7tHbWAKoM9BNl5S9b7uBFXcr9tmvN8rVqtOoCsuOHASZ+mrTiMizVv67rwfNit5STBsnrznyak/uY4n4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxlQ3VE1; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxlQ3VE1"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so5975202c88.1
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 04:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791545135; cv=none;
        d=google.com; s=arc-20260327;
        b=SaHPzZSuMKqT73OSRrsGeFn7PySMV/qRSPuVwUkhwNoA1anvPB1Ud/PPrhCzzy+Mq1
         7cMaJetfn1/rrPRtRPhNlhVoYYcf6KXr/ALhh9wKbCNsl5NNTOswhR2ONemDDuPaI92U
         LNoPrPBBTiUaFNJy8FAZzIljwf84URJAjAFSXlkcgvg9d2gMxwoCyjDjwag+ptDVQT0f
         n01yc1vgJquVJHXK34COPT/Ti4t1kg6gBbNoJo3M6Eff2nsSQW83olRWs/+xYWzOPgTV
         oyXTWlgzCwIYKJtnvo5oUTL9Hr2WJiitb34se9AaN97Ib1s4pNdPA3My8qFZdB8GA+/O
         DCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3h8UQBP51r8W4IhHXWciHjxZ3ysVCZhKndKhUmVTiaE=;
        fh=rXsAebcxRaTNesKtixG+AK+pqoKu/2Y8ZB9ScVmhDZY=;
        b=mzN/M8kKCvVu2Nz6bti4bykvw+1OFteY1urxhEF90UAqkV76OMJ+wARrP/hSOCiDSK
         MVDa4rm8mdQ4USqUYekzHpbl9rTYmW/RKpCEptf8DG4NmnQCFPpOAgLR5vGEVGrSvoEW
         rS25FCYlBFr+lzh7x2rbpKJqsTmhR2dxSZ4RJPIshlaskeqUwXfiyvKvh86MMd/B1KaR
         Pu7XA8YqSFKDsGXb+B+XPgGG2QJIlZ5NnIQDoElQ8jYnZf/S90nMWfWpWZwY2BVoIdD7
         UhUbEhQ1K0p5tq05jJTPQbsljHWoToYiYYwGCUeJHIo8nd4mIZKhNj5/hbUWI94nwRDf
         /nzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545135; x=1792149935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3h8UQBP51r8W4IhHXWciHjxZ3ysVCZhKndKhUmVTiaE=;
        b=VxlQ3VE1oOFgUm1E9WZpBRb+HYT7FQxPYlYWEBPkQaR1yt2YNAdWNAKVguRClxM1XZ
         owDkIjq/+SFmO2wwVnznD6Lj3PEZjzO+uwCeLxNgFCEyYDlvrITJC7gjPkJE3z7yJ95g
         noojbEJnoxfKbQiYiJpQ7ZvjnE8g/3RR6iTauaeSyMNmMWbVl9eH4tUhKfU6vB11oeXa
         580czBzYGptVKGhMuzUeMDxFl4U4JLkfqlGfnVKTm24vSZZTup3/W17MLnb/IYQtW59Y
         urTPa8e4CcmWIj9a924AAlykshBY0IYPa3BzzdFJwpouj0pDsLak+wcftGpb6U9GEkiF
         NQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545135; x=1792149935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3h8UQBP51r8W4IhHXWciHjxZ3ysVCZhKndKhUmVTiaE=;
        b=nYvVoA/LQ9r027zJqGQ4hDmh5j+cpmTALeu6hlbDatkdlVpuWc0lE/AmaHOZmU+vPu
         O23Hgn0uXu6ibuG4IRdWyS7niSGh0bSefOeoNeDvizpsrey0ZTWpdGQO+yCzyez+FZbw
         QShGbpUwV2ynwKMwY/kGSBUtkxQDgTxKP1vrjH2kA+yilai0Br+d1oVt+NLZ2pYH56yu
         CikTklyeZ0htSdBDyBO6+HKkO8jfp7GsyeXsylsdyTW3szE03q9pYHWV/4mCPfaaH8YR
         PARdvg35FlaNAHjc0y61laG80FMwS/qyxCJvLHw9CV+kYZaxWNrn7LSDR9Np3nMtMIbB
         1j2A==
X-Forwarded-Encrypted: i=1; AKwUvBw1OaKtdwpGJik8wJUvnIOdhY+u26PNlqTi2E+HLwkA66LXzexVqazRroy/p/xe2VjOClunqIFZTTXUbw==@vger.kernel.org
X-Gm-Message-State: AFuF++lAcUhDyT0eKX6uM2SDcrAns8dDZbijm1A/ROTFjaGM0EQgcEB/
	FLXLqqtSzYCg+GN75g2BPcTivkilOw9rlfYHGoLIRbFPItoeZIx0MktJSMQSPCZbTs+C70/fFpe
	DzPTW3dfl2utWnFuSyjpvqjAQwP0rCYQ=
X-Gm-Gg: AYBFou1tuRlxgaOPe59NPEoejSvuV0jJxJ0d7+YP7vFQbm0WBx2OiwRElgtTxquiUCg
	GG8LHapvoPsOccKDOjbVtZtnL3cttj2plpwlpAYKTj4f1TacOCH7E394zFJ/q7UCDqv9TyB7AJt
	TMC7Av3kaPPyHwHLrCkM/Y+8HIzurgI/dMZlBEEqaCYhrf/O5BuMQQ1/pPxQWKnrqymvmKy3oh4
	/tiS4Lw2ykEW3TT5hOyi6qm6RV0mAdbsiBW/wNOEtewt1SJhJV5ii1SNFLIqcwi8TI+egOPB7Kt
	WOQpirXlCh8SPUae9RJ16fGHm2kDJAZjEbdnLCZiRyAE1AojazruR6dE3m82my226m2+337d4gm
	tQxxWjm1pHOAS0+rbsoiUfpergg4sxERRVIWne8oLD2r705IrK/yZw98rP5Qi7RL+xGhz6Xn9HA
	==
X-Received: by 2002:a05:7022:ea8b:b0:145:287:ce91 with SMTP id
 a92af1059eb24-16a5c6ec19cmr1935064c88.14.1791545135158; Fri, 09 Oct 2026
 04:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com>
 <d9a37aff-3b4d-467c-825d-5473b4c1bbb4@ideasonboard.com>
In-Reply-To: <d9a37aff-3b4d-467c-825d-5473b4c1bbb4@ideasonboard.com>
From: Alexander Patrakov <patrakov@gmail.com>
Date: Fri, 9 Oct 2026 19:25:07 +0800
X-Gm-Features: AclHuK_KJ4z40Xv18UozXmWlu8ebAe6KAI3yLSiPtsSXhM6g8_xz4hVi5iHw1kM
Message-ID: <CAN_LGv0nBTkVmxbuK+_O1v5Z_OZqQz5LgEZdL1_37otsei36fQ@mail.gmail.com>
Subject: Re: int3472: GPIO type names disagree with Intel's Windows driver
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Leif Skunberg <diamondback@cohunt.app>, 
	Sahan Nissanka <adee.sahan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 6:03=E2=80=AFPM Dan Scally <dan.scally@ideasonboard.=
com> wrote:
> On 09/10/2026 04:06, Alexander Patrakov wrote:
> > Hi,
> > Why I am not sending a patch
> > ----------------------------
> >
> > Giving 0x0f, 0x10 and 0x11 their proper names, while 0x0b and 0x12 keep
> > the ones they have, means two names end up on two types each:
> >
> >    avdd   0x0b (PowerEn) and 0x10 (Avdd)
> >    dvdd   0x11 (Core) and 0x12 (Handshake)
> >
> > A system whose INT3472 declares both members of a pair for one sensor
> > would ask for two regulators supplying the same name, and the second
> > regulator_register() fails with -EBUSY. No type shares a default name
> > with another in mainline today. I do not know whether such a system
> > exists; Intel's 2021 build handles Core and Handshake as separate steps=
,
> > so the firmware vocabulary at least allows it.
> >
> > The ov5675 driver asks for avdd, dovdd and dvdd, and all three are
> > already the default names of 0x0b, 0x10 and 0x12. So I see no way to ad=
d
> > 0x0f and 0x11 as general types without reusing a name, whatever is done
> > about 0x10.
>
> Does the situation need amending? The handshake pin being modelled as a r=
egulator named dvdd is a
> deliberate situation; see Hans' commit message in c5d0393272048 ("platfor=
m/x86: int3472: Add
> handshake pin support") for the explanation. I would think the same appli=
es for PowerEnable (though
> I suppose it could also be legitimately modeled as a GPIO, but sensor dri=
ver handling of those is
> less consistent).
>
> Is there some sensor case you're aware of that's not working because of t=
his problem?


My sensor does not work without a patch that maps 0x0f and 0x11 to
something that the ov5675 driver tries to enable. The INT3472 of the
Lenovo Yoga Duet 7 13ITL6 declares types 0x0f, 0x10 and 0x11, plus a
reset and a privacy LED, and neither 0x0b nor 0x12. But I am reluctant to
send a patch that knowingly gives a GPIO type the wrong supply name, thus
spreading the mistake.

I have read c5d0393272048, and I accept that "dvdd" for the handshake pin
is a deliberate abstraction and not a claim about the pin. Type 0x10 is a
different case: its commit says the pin controls the DOVDD rail, the
constant is named INT3472_GPIO_TYPE_DOVDD, and Intel's table calls that
type Avdd. That one is a statement of fact, and it looks wrong.

Here is the whole story: Claude, initially, found that the driver
complains about the two unmapped GPIOs, matched that to the three
regulator supplies that the ov5675 driver requests (avdd, dovdd, dvdd),
and _arbitrarily_ assigned the two supply names that were still free to
the two complained-about types ("GPIO type 0x%02x unknown; the sensor may
not work\n"). At least it told me about the guess:

+ * There is no 0x0b (avdd) and no 0x12 (dvdd), and the sensor needs three
+ * rails, so 0x0f and 0x11 are taken to be the remaining two. Which of the=
m
+ * is avdd and which dvdd is a guess; ov5675.c enables all three together,
+ * so the labels do not change behaviour.

Then I asked Claude to try harder to figure out which is which, and at
that point it found the table in the Windows driver. It then created a
patch with the mapping that follows the table, but added a DMI lookup to
int3472_get_con_id_and_polarity() that matches the tablet, so that it
could override the conflicting generic mapping of 0x10. I started
questioning everything, and finally got this:

---
Your clone is at v7.3-rc6. The commit is 2a7b7652b1bb, "platform/x86:
int3472: Handle GPIO type 0x10 (DOVDD)", by Leif Skunberg, February 2026.

The commit message asserts the meaning and gives no basis for it. It says
the Fold's _DSM returns type 0x10 for a pin "which controls the DOVDD
(digital I/O power) regulator enable", and nothing about how that was
determined. It does not list the machine's other pins.

Version 1 was a quirk for that one machine. It added an entry to the
per-device GPIO map. Hans de Goede asked for it to be handled as a new
generic type instead, and for the name "dovdd". So the generalisation to
every machine came from review, based on a single device.
---
...which links to
https://lkml.iu.edu/hypermail/linux/kernel/2602.1/02605.html

So, I tried to investigate the same Fold that served as the basis for the
initial "dovdd" type assignment to 0x10, and Claude found that the Fold's
own Windows driver package contradicts this assignment: its table names
type 0x10 "Avdd", the same as the table in the driver for my tablet.

I asked Claude to fix int3472 so that I can submit a patch without adding
further wrong statements about avdd/dvdd/dovdd, and it flagged the risk:

---
Renaming 0x10 to "avdd" breaks any machine whose firmware declares both
type 0x0b and type 0x10 for the same sensor. The driver already names
0x0b "avdd", and registering two regulators for one supply name fails,
taking the whole INT3472 probe with it.
---

That comes from reading the code; nobody has tested it on hardware. I am
not aware of any such machine, but that's only because I am not aware of
anything other than my Yoga tablet and the Fold.

Thanks,
Alexander Patrakov
