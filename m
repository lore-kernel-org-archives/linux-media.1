Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13D838398D
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 23:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476969; cv=none; b=A6dyB9Uk6yreAX6YAGWYjbElgLGPuYtkwglMhIIYrw7zgtNR0uZPa6TUclf/E1d3jegTemaZ+dd1gf4XVsTkIJ7W/txZXUmKC2m08ryNmqasdl+wAfRPFCUXswVyc8PKNyotISAffbCRQH/HxkcJdckbI1eGRiQazZxxzZG1Uvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476969; c=relaxed/simple;
	bh=P8RUFfmeAnm/5LIA07tpJfOn1lfOF5+Ue/6jgBrHPnc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=RHR/xDOoJI1BJgQKgw5IvW1n0YNRHuVQbiTkynKA2z7WTlWI0li0XOlfZu3gRN4JPhwihtYzuiFgPbrdXa/DC2jxrdRGDCnsPZvxXw46hhu7nWWP3MvvJtaImaD78odc8bHBBSfVtquE8FZfeeQaFamnDAzCEgmI59LT+KcKyOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4704f08bcd5so345758fac.0
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 16:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476966; x=1789081766;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:in-reply-to:date:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=P8RUFfmeAnm/5LIA07tpJfOn1lfOF5+Ue/6jgBrHPnc=;
        b=DMnr3MruVdmfQZw/nxoJmpScvA6VxrTIUD3i804HTj6HNim0ZzB/obX7llmXr0SHFB
         sxHLEsi6QYTEJKzszdUVe9NUwbJHo1cef1l1yrXaNy32rVEmhiFfInjQ1ApNnY8lPdxm
         GUO4Gm/J7DjPcD/Ys+Ee/EWd35jmlENf2TQYkHOAFyhrypF+i6GYCK+JnUBuxKCSCKIQ
         S9PLRAZBvhM89p1yyzEwhODFWaAsYldbTzXwDlqwa5r5wgzlotNa1dGM4zrvvp88YqGZ
         TDSDAUZxliVEVp2Ajj0yS46nQndwGXG9ijZUC+HCVQjcEtbBxytqcGVSnGEFYLwHLsl7
         Nubg==
X-Forwarded-Encrypted: i=1; AKwUvBx17xWWrFIRBGSBCTn/KOKrlC62pVXK2FUJl/IMf8fDiidLN9TrExqIM5BoGg5I853T72xjd0ER8pzf4g==@vger.kernel.org
X-Gm-Message-State: AFuF++ngIkFxrSynZiLYhZQ7HGTLPsQUA6tLy2IH67usFaaaQESjffav
	/rdhlWjtEt/x/nn54wbiTpb/2rduvr7RpYDvskxXFrbZZUJlvIHFoHOjdFEP+trC8bu1FJd15EO
	ltO1G8CPUgnI6vct9wgGKS+ObAcZmRKOiKIpV7TNIKgcgZ7ofpm+B34dy2Xw=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a50e:20b0:6b7:46fa:16ac with SMTP id
 006d021491bc7-6b746fa1b09mr153167eaf.65.1788476966736; Thu, 03 Sep 2026
 16:09:26 -0700 (PDT)
Date: Thu, 03 Sep 2026 16:09:26 -0700
In-Reply-To: <56eb8af7-8f1f-43ef-9f77-6afb526b2d82@me.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a99fe26.9266084e.bf0d7.028a.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in cx25840_init
From: syzbot <syzbot+9123948aef13fe92d706@syzkaller.appspotmail.com>
To: m.harisawan@icloud.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	m.harisawan@icloud.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> #syz test: git:// git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git 940de590b839f71d6dc846160534bf202401b8b7 diff --git a/drivers/media/i2c=
/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c index a8=
e21a28174f..6df912c9381b 100644 --- a/drivers/media/i2c/cx25840/cx25840-cor=
e.c +++ b/drivers/media/i2c/cx25840/cx25840-core.c @@ -2298,28 +2298,26 @@ =
static int cx25840_init(struct v4l2_subdev *sd, u32 val) struct cx25840_sta=
te *state =3D to_state(sd); + if (!is_cx2584x(state)) + return -EOPNOTSUPP;=
 + state->generic_mode =3D true; - if (is_cx2584x(state)) { - /* set datash=
eet video output defaults */ - state->vid_config =3D CX25840_VCONFIG_FMT_BT=
656 | - CX25840_VCONFIG_RES_8BIT | - CX25840_VCONFIG_VBIRAW_DISABLED | - CX=
25840_VCONFIG_ANCDATA_ENABLED | - CX25840_VCONFIG_TASKBIT_ONE | - CX25840_V=
CONFIG_ACTIVE_HORIZONTAL | - CX25840_VCONFIG_VALID_NORMAL | - CX25840_VCONF=
IG_HRESETW_NORMAL | - CX25840_VCONFIG_CLKGATE_NONE | - CX25840_VCONFIG_DCMO=
DE_DWORDS | - CX25840_VCONFIG_IDID0S_NORMAL | - CX25840_VCONFIG_VIPCLAMP_DI=
SABLED; - - /* add additional settings */ - cx25840_vconfig_add(state, val)=
; - } else { - /* TODO: generic mode needs to be developed for other chips =
*/ - WARN_ON(1); - } + /* set datasheet video output defaults */ + state->v=
id_config =3D CX25840_VCONFIG_FMT_BT656 | + CX25840_VCONFIG_RES_8BIT | + CX=
25840_VCONFIG_VBIRAW_DISABLED | + CX25840_VCONFIG_ANCDATA_ENABLED | + CX258=
40_VCONFIG_TASKBIT_ONE | + CX25840_VCONFIG_ACTIVE_HORIZONTAL | + CX25840_VC=
ONFIG_VALID_NORMAL | + CX25840_VCONFIG_HRESETW_NORMAL | + CX25840_VCONFIG_C=
LKGATE_NONE | + CX25840_VCONFIG_DCMODE_DWORDS | + CX25840_VCONFIG_IDID0S_NO=
RMAL | + CX25840_VCONFIG_VIPCLAMP_DISABLED; + + /* add additional settings =
*/ + cx25840_vconfig_add(state, val); return 0; }

I've failed to parse your command.
Did you perhaps forget to provide the branch name, or added an extra ':'?
Please use one of the two supported formats:
1. #syz test
2. #syz test: repo branch-or-commit-hash
Note the lack of ':' in option 1.

