Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834267;
	b=TObng3fk7qIR7351qDLOY4WtepRudfc8FglsLmlhoORYeyB8XHt8Ff5bfUk/pCZtL8Ca
	 zssxh6Hcqiies/WIfLeDRJwC2sTOvF5BododFmbHJQzHb7XR+pkfYi+zfxFyCduZeDwI5
	 g3ywN0xkPIYrgH2wfY6/GKqmf/Qi4FfUeYKou+HiBPEociKqLheVc5HBARRvrnCVKDThO
	 H0oU6mdBZljHOCUdSy5dtW4rn6jWoKrXvYVZfpzrHZPCQzAQRajqHT/bkwaW7NkqvmyER
	 azU+84GNf3dprSelEYVXdcdsX6axnZJtzpjM6YSKTgkq3/pa/KQpaMqs75kMfGWwbgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834267;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0ig/7/QrdpCDxXtWkwmfBcbB/v9MdGwTTP1BzaPF+ok=;
	b=NkSyWGTfFG60ezwK6ZvwRlFwan9RPg1FjPFay8QmN6VHJ/Fneat+cXnWDzXrOsOjjpUN
	 dOdlKbUwfNHI/UPN5YBZQWXPqmjPybTKX1reDTqCSp1YMk/1lKk8FPJb65HkEiJ+MtPLt
	 YDxD5gpBm0bUHnauWRP99Y9A//u28FFwcZYjQjXyONGsWXibuSOy4KaPloiZt/Jh3dwzN
	 fLIQFWvTiYfm0k5pjvz0o88iycb8OU9jKonaNmpEVrNsaTbgObzK315CAYe2Y+DPwxdeW
	 /0S4MTRunYN/YBnNNr6MtjuqWRKCVzXh9TDxG8nNPu9qEXew/wveD3/c5jK2Oa+AJ3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75839606A31B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 23:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75839606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so12064261fa.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 15:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834265; x=1794439065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ig/7/QrdpCDxXtWkwmfBcbB/v9MdGwTTP1BzaPF+ok=;
        b=0T5S7m6NyXFizGYUQOdA/gcYUcXl7DGz747i/FDi0h0zc/DuFoEL0YXxe34u9mJGxy
         8fRYp/tESq8/Xyqe6NeE+T9EEPw90Kdt7Z7kd8QmHMJbPSRDnXy3yk0ssFW1/RhnKgR2
         0Sw6LqrcsYiMramQ6bs/JZ8RTZHI26LqbWQZeiEzxoFKEj7j3BNdHTgT83PZDZ1wLFae
         apZxMqORgS/YYHx1fDwJ53BV4rUfEwDvMDvsHdhIO0zH3luLxeS5KH94NLMGAx0SxKyF
         DXaEpdqVqlMyZHQLcWrRWhPF0hEPjFXBEKcT5TpCKbG9vaTs5ckLhqYw9FKYoHiq4ORk
         jejQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX6PVlFYPQKbHfJkMR+kjXV05HNgVB+/CcXsVdGgTSa6AGFWF2tvjb82klXs0HHuFyn1qH/m0qqsdgoA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/+0WD0lWeM8DCvBfNW8iUhdluH9iaA4Sy/9JLVswjsFozL5bG8
	yMcOoqiKGg2XvBa5ZOjdVu+7+J6r8s5eLvo0+GowWhJ0WFeDwhKs4I+qe84UVBGYJyA=
X-Gm-Gg: AYBFou0qSZVh+PGk6MsUUB/NdPwGzzJn4rCXTlQu5E5Bs3Hurc4kgqf6jRt3ndJbifc
	qBYSqgqsBoZiP7t21eTzlvaB0v8uUzgIoz3z+G4SE43EVFsi6pDKnZ9adwKkGgb/NeH4Tf+fD7w
	vJjyhovZj0HSonH8jDqLjUrxKs5zK3M5awVcJFovoc5TNOIpjm3SBYA7/4kyJ4NAi/2jAJMRORO
	Hy7mDGRLf+2Rsm1QmwDK4VijHu9cBn5lDST8PWsXrqzQ0VpvPRpEjDT+HMOGxzYR0cXawPf68vU
	w/yOy7MPbtry6RFKGhKF70W/wCW1ODXvDEPjgDh/FIlawmATyslLk3dUDi/DYSu4t6OAnw0mxqx
	PVSAFQA+Jck5diJmZ+322gcbaReA5bE1Y4EBwutvX0Xf7q39eGeorkDhbW5LlJbYd8chbqYkkzI
	nOsR/beMCWbOXno2JRSPXr10yTT9O63WrLHR9De+yfrh02snF54rRePweNu3hVAQ0jUGFfQNxHG
	9VZFW096FicYDXsn1bA7en8abcsDdz54gW4fAxPervrm3ALbux9/HDulC1SGv1c702odIl6Rtu+
	zOTz88V3+7ue8qpQBP+ATlpe/5ycLf1egQIF/Br4Ue28MOiZ+O31lxYpjOzwnZhhbg2QK70NXMn
	jvR6I98bZ0SUi
X-Received: by 2002:ac2:4e13:0:b0:5bf:d110:585f with SMTP id 2adb3069b0e04-5bfd9513782mr6029763e87.0.1793834265353;
        Wed, 04 Nov 2026 15:17:45 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38c15a4sm567758e87.49.2026.11.04.15.17.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:17:45 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1011372e87.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 15:17:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzg1bw33aoA6jgg13SXTVFdfHqyUy9xJE4pi8xzNpaCjJ6W77iPC7YF9Uo0RCh6mj1kCkhj2/HK8Up9pw==@vger.kernel.org
X-Received: by 2002:a05:651c:31d2:b0:3ac:e4b6:b93d with SMTP id
 38308e7fff4ca-3ace4b6bad3mr1250481fa.8.1793833951678; Wed, 04 Nov 2026
 15:12:31 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev> <c5405525-78ee-4480-b482-4dedc49661a7@packett.cool>
In-Reply-To: <c5405525-78ee-4480-b482-4dedc49661a7@packett.cool>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Wed, 4 Nov 2026 20:12:04 -0300
X-Gmail-Original-Message-ID: <CANn8Ume7MfDKhjdZAc3Qha7_k=CFFzaxzk5nK9Ke8iNOveYyRA@mail.gmail.com>
X-Gm-Features: AclHuK9-uWrMe0XXfFl-zEd0pTQ8lUonEa8rXy8zxcLRw3JRTxzZbTIo1byB1YQ
Message-ID: <CANn8Ume7MfDKhjdZAc3Qha7_k=CFFzaxzk5nK9Ke8iNOveYyRA@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
To: Val Packett <val@packett.cool>
Cc: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Val,

Thanks for the review, and great timing on the SC8180X work.
> It should probably go higher in the sort order, before 8250?
Agreed. I=E2=80=99ve moved them for the next version.
> Interesting, why do these match 8280xp and not, say, 8250?

SM8150=E2=80=99s downstream DT describes the PHY as qcom,csiphy-v1.1, and t=
he
v1.1 2PH (D-PHY) lane sequence in cam_csiphy_1_1_hwreg.h matches the
2PH entries in lane_regs_sc8280xp offset-for-offset:
- 0x0004, 0x002C, 0x0034, 0x001C, 0x0014, 0x0028, 0x003C, 0x0000,
0x0008, 0x000C, 0x0010, 0x0038, 0x0060, 0x0064
- lane blocks at 0x0704, 0x0204, 0x0404, 0x0604
- with 0x0728 =3D 0x04, 0x0700 =3D 0x80, 0x070C =3D 0xA5, 0x0738 =3D 0x1F

The SM8250 lane_regs_sm8250 table is a different sequence (0x0030,
0x0900/0x0908, 0x0034 =3D 0x07, 0x0010 =3D 0x02, etc.), so it doesn=E2=80=
=99t fit
the v1.1 PHY. If SC8180X uses the same v1.1 CSIPHY, the SC8280XP lane
table should be the right starting point there too.

See https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-co=
ral-4.14-android13/drivers/media/platform/msm/ais/cam_sensor_module/cam_csi=
phy/include/cam_csiphy_1_1_hwreg.h


El mi=C3=A9, 4 nov 2026 a la(s) 6:19=E2=80=AFp.m., Val Packett (val@packett=
.cool) escribi=C3=B3:
>
> Hi,
>
> On 11/4/26 5:54 PM, Andrew Gigena via B4 Relay wrote:
> > From: Andrew Gigena <mail@andrewgigena.dev>
> >
> > Add CAMSS platform data for the Qualcomm SM8150 SoC. The camera
> > subsystem contains four CSIPHY, four CSID (two full and two lite), two
> > VFE and two VFE-Lite instances.
> >
> > The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> > VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> > layout. Add CAMSS_8150 to the version enum and to the shared code
> > paths, then add the per-block clock, regulator, power domain,
> > interrupt and interconnect resources.
> >
> > Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> > ---
> Wow, what an unbelievable coincidence =E2=80=94 I just went looking for t=
his and
> found these patches on gitlab in order to test on the similar sc8180x,
> and half an hour later you've submitted it to the lists! :D
> >   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
> >   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
> >   drivers/media/platform/qcom/camss/camss.c          | 262 ++++++++++++=
+++++++++
> >   drivers/media/platform/qcom/camss/camss.h          |   1 +
> >   4 files changed, 267 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b=
/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > index dac8d2ecf799..851decb0691e 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> > @@ -1141,6 +1141,7 @@ static bool csiphy_is_gen2(u32 version)
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> >       case CAMSS_X1E80100:
> > +     case CAMSS_8150:
> It should probably go higher in the sort order, before 8250?
> >               ret =3D true;
> >               break;
> >       }
> > @@ -1236,6 +1237,7 @@ static int csiphy_init(struct csiphy_device *csip=
hy)
> >               regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sm8250);
> >               break;
> >       case CAMSS_8280XP:
> > +     case CAMSS_8150:
> >               regs->lane_regs =3D &lane_regs_sc8280xp[0];
> >               regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sc8280xp);
> >               break;
> Interesting, why do these match 8280xp and not, say, 8250?
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/me=
dia/platform/qcom/camss/camss-vfe.c
> > index 2680a9914765..dd28058e98a7 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -354,6 +354,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, =
u32 sink_code,
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> >       case CAMSS_X1E80100:
> > +     case CAMSS_8150:
> Sort order here too
> >               switch (sink_code) {
> >               case MEDIA_BUS_FMT_YUYV8_1X16:
> >               {
> > @@ -2010,6 +2011,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *v=
fe)
> >       case CAMSS_8280XP:
> >       case CAMSS_8300:
> >       case CAMSS_845:
> > +     case CAMSS_8150:
> >       case CAMSS_8550:
> >       case CAMSS_8650:
> >       case CAMSS_8775P:
> > [..]
>
>
> Thanks,
> ~val
>
>
