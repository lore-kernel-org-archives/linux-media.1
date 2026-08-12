Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FF3325704
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520841; cv=none; b=kIbayW9xAxiUljCiqbLTNHG3SVuCax9K81onk9x0TgZpa7vEzwy+XnVvD+A6ET3AgFruWhxf+G9/baiZcxJNCn7dScWtwmePA5wLR1f+87BGh/zwuAdpGZU5NYbHVUWPBpcuyhLbu5QnHVLOexbTshhwNpCL7ytN/rNBcfl59Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520841; c=relaxed/simple;
	bh=DZ9M7mnW5jZJNJ+q7syZtuYzgj7TjznYGIKAUoJpKL0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=btKL3CYEFcnty5a4STSt4g/YMisYom8asg86q94tkLHJwLUDKL3WqFa7+gYbXBC+VHmdvSufoQlr2RCrlNekTbisolBHeMiNVjagMpfMvGffhb6bSozRdGN3Y5OQyg1sYh8D2Jt38cKJG49GjkmKZ9Stkq8p3gUkSIRjHeorNUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=0O8ngfLN; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="0O8ngfLN"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso1008735a12.1
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 00:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786520837; x=1787125637; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DZ9M7mnW5jZJNJ+q7syZtuYzgj7TjznYGIKAUoJpKL0=;
        b=0O8ngfLNuIwP7YsIKf5H2Ej48wvKXfmXtjbRrkwyL5oLMcgIJdClfgJ1AsGQVxhkmh
         ieyzOBQuhblanBAIQfMcV7x6DJVJLrCHJ21s4p78e3tUO1LbYg+a+XsyPXYv1RKnBvsv
         uzzHQaOZQrbkbMOVNmQRg4/lDLuVVC/8TuQ3lA86hR/KRbnq3KQnMUg9Fk3gLO4KP1Hv
         boAECvi1DxZMgpYMSHH1OuOV8+Fl9+fF3r6BzEAK8IadBw9u0Zvak3ZM0Spc+6E7dltf
         hPV+9liY8OmfC8MZyRZzmJEIFR9k6+mYqgtQvb9sKyNt0A/xArfACTrAvF7AFeHvDQku
         ZZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786520837; x=1787125637;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZ9M7mnW5jZJNJ+q7syZtuYzgj7TjznYGIKAUoJpKL0=;
        b=XWjhSx4WtxIAc3/e0GUi25PTwh8SThBpkP/tI6N6jUD1ohizq5wvtnmULhM+dKHfH9
         3fKYc8F7J0o96KnyYk4U3wOG/YZwUUSyKT7SwB8TduyLr/PzG0KKOlCrZuf7TN/NiVwM
         Fnjj2alqBA7LluHtfxTPXRV/YE7Gq8GoFeTwqZwO7Ai16gtk3AYr5Nj9YAfvXiFdUct4
         gmpkdUwgMu8Zm6uM2vfobgjpyAzGU6RLyBqf4IBmgMB5wyztiehIf28rOP/znUToaji4
         sJAjtRp4R34kHYZBtUANn0ymgbRN7amPHF/aw4xBD5EmrM0R2EXfGjPoc7e37c/aVCRi
         UcRw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7h8zIj/IKIkprtcikHmtJISNeQk/ESuyFsKp4Tuz4rB5ihBgwHNjmXlgnFmGy6cWGfkE4zx1eUgK8Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu4IOUiuLxy2qlEcoenVIf+MoDtkaq5+bTmucBuS8YLO+Jauh0
	q3lO2jVXop+GaVI9fYQtHoqIUdu2ynIrZ9TIai6xf5fd/PbK/x2yWp6mWQmlyWQ1f3c=
X-Gm-Gg: AR+sD10KLawa8bcdedOLY5th5aQbEWjuYBu6KKDv/MzQgtinPYgzW3HNPWVtwPB6YDN
	55Xowzfou2IbSuS/4QYabN/lj5U5DzaCTHg+b54anOU2sm4aubkduspiot8Hl3wkqqVFjxo2W7m
	W65YpkrWoDw8YkC8H2kGaoWVFZFOPclvE/59qosM7cQNJ6nIdTdSHmbWX+q2sbDoQ3npuKyhVLJ
	83C5ojgHG1/fA+BD/g+0Hp+AdTRPwtnBBoerbEylDL3lZY8PubM+QTcRoOa+zcWoepKeR84XPkW
	TBITmyyaK+k53Uc35lEaHC4zAZZMt05hX4XNCSdxC9vur7Tc/50heA7A7F9NOpeAo14duSUwmRh
	xZSVIUvP+5Cw8Qy+aniCk3E6MrLFOeq383OMaW6W29w7kFhJ9qllRzCFkAqSoMFjC48bEf+pt5d
	x9rPtA8n20QuZm0Pdyvg0h7VO6qqG3ZRk0q63Qmk/lICf/5+IZHIFtPh5AaC5spLNahNacQYtr5
	02UyjJmxigtLxOK1DmTSL/t87eVuwLjBw==
X-Received: by 2002:a05:6402:24d3:b0:69f:b347:a681 with SMTP id 4fb4d7f45d1cf-6a375e9bb79mr928738a12.4.1786520837441;
        Wed, 12 Aug 2026 00:47:17 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3768b989fsm366900a12.10.2026.08.12.00.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:47:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Aug 2026 09:47:16 +0200
Message-Id: <DKMSS66NWU51.4K7QJ4ITAPMT@fairphone.com>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, =?utf-8?q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, "Daniel Scally" <dan.scally@ideasonboard.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Eugene Lepshy" <fekz115@gmail.com>, "Vasiliy
 Doylov" <neko@altlinux.org>, "Achill Gilgenast" <achill@achill.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH RFT 2/3] media: i2c: dw9719: Add DW9800W support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Danila Tikhonov" <danila@mainlining.org>, "Griffin Kroah-Hartman"
 <griffin.kroah@fairphone.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
 <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>
 <anGlY_kwp_I-fRnz@kekkonen.localdomain>
 <f7cae569-0c51-41fe-92ab-f29311a22761@mainlining.org>
 <anMeoKP6rUlgtKyR@kekkonen.localdomain>
 <3554d8d1-65f7-4556-8b99-1c03e0cdca53@fairphone.com>
 <dc1040f9-0ffc-4e64-a154-ece99b16eea5@mainlining.org>
In-Reply-To: <dc1040f9-0ffc-4e64-a154-ece99b16eea5@mainlining.org>

Hi Danila,

On Sat Aug 8, 2026 at 2:42 PM CEST, Danila Tikhonov wrote:
> Hi Griffin, Sakari,
>
> Thank you for the clarification.
>
> On 07/08/2026 17:30, Griffin Kroah-Hartman wrote:
>> Hello Sakari, Danilla,
>>
>> On 05/08/2026 13:29, Sakari Ailus wrote:
>>> Hi Danila, Griffin,
>>>
>>> On Tue, Aug 04, 2026 at 09:27:01PM +0300, Danila Tikhonov wrote:
>>>> Hi Sakari,
>>>>
>>>> Thank you for your comment.
>>>>
>>>> On 04/08/2026 11:40, Sakari Ailus wrote:
>>>>> Hi Danila,
>>>>>
>>>>> Thank you for the patch.
>>>>>
>>>>> On Sat, Aug 01, 2026 at 09:04:15PM +0300, Danila Tikhonov wrote:
>>>>>> The DW9800W uses the same chip ID and register layout as the DW9800K=
,
>>>>>> but requires different default VCM frequency value.
>>>>> Is this a real difference between the two models or what fits for the
>>>>> attached lens? Too bad the datasheet isn't publicly available. :-(
>>>>>
>>>>> At least the differing default and constraints for=20
>>>>> dongwoon,vcm-prescale
>>>>> needs to be documented in bindings.
>>>> I share your skepticism and have essentially the same concerns. Since =
I
>>>> do not have the DW9800K datasheet, I cannot say with certainty how it
>>>> differs from the DW9800W.
>>> Indeed. The limits should have been added for dw9800k, too, but I=20
>>> guess I
>>> missed this in review. :-\
>>>
>>>> In particular, the parameter referred to as the VCM frequency in the
>>>> driver is used to derive the SACT value. For the DW9800W, SACT[5:0]
>>>> defines the actuator resonance period in SAC mode and the one-step
>>>> period in LSC mode. The datasheet gives the corresponding formulas as:
>>>> - tVIB =3D 6.3 ms + SACT * 0.1 ms
>>>> - LSC 1-step period =3D 252 =C2=B5s + SACT * 4 =C2=B5s
>>>>
>>>> Therefore, the default value may differ between the DW9800K and DW9800=
W
>>>> if the formulas or timing characteristics used to calculate SACT are
>>>> different.
>>> Griffin, would you be able to comment this?
>>
>> After checking on my side, DW9800W and K are almost identical in both=20
>> structure
>> and register values, including how tVIB and tLSC are calculated,=20
>> DW9800K has an extra
>> register that can change the output current to 130mA but we don't ever=
=20
>> use that.
>>
>> We didn't have a datasheet when working on the DW9800k so we had to go=
=20
>> off of
>> the downstream driver during runtime to get our register values. The=20
>> datasheet is a
>> much more reliable source to be using for this instead.
>>
>> My colleague has already identified ways to fix the bindings, which we=
=20
>> will
>> tackle ourselves.
>>
> I'm glad you were able to clarify the situation, as this should help us
> handle both IC variants correctly.
>>> Another matter: the comment on dw9800k says there's no device ID. So is
>>> there a device ID that wasn't just checked earlier or is there really n=
o
>>> device ID?
>>
>> Indeed, it turns out the DW9800K DOES have an info register, which=20
>> should be
>> 0xEB, that's on us for not updating it after we received more=20
>> documentation.
>>
> Given this, and assuming everyone agrees, I think it would make sense
> for me to leave the DW9800K untouched in the next version of this patch
> series. Since it turns out that the DW9800K has a different Chip ID, you
> can fix the Chip ID check for it separately based on the information you
> have.
>
> One point is still unclear to me, though: is the default VCM frequency
> the same for both ICs, or does it differ between them?

Like Griffin wrote, the way the driver/bindings currently handle
especially dongwoon,vcm-prescale ("vcm_freq") is completely wrong **for
DW9800K**. This wasn't done better because no datasheet was available to
us for the DW9800K at that point in time.

Sidenote, I found a datasheet for DW9718S and that one seems to be
programmed correctly. I can't comment about DW9761 and DW9719.

Please wait with adding DW9800W support until this situation has been
cleaned up by us since it's the same registers with both DW9800K/W.

Regards
Luca

>> Thanks for drawing our attention to this! Nice patch.
>>
>> Griffin
>>
> ---
> Best regards,
> Danila

