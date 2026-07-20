Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A405392C4C
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537746; cv=pass; b=ddnikfU7MZUnVPInpfbdC69ukN0gPOdLWPZRgxwC6cqBq2wHtlok9zItUVNlrJ9IsN0yrxql5kxt12XTvVu1Qu1UGjCr0+oGiN7bJivex5vl9kbnX+iGXDwD9AE9nfS9I+MovhVomJadX/3SShYkNbMMYFjmJFiJBC82t2JgGZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537746; c=relaxed/simple;
	bh=fmPo3YI6uCHOrEltD7Nq5KoHM5BVX3BZmTMqwCweE08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyuK0tnqZ4v1i65f71Qdw1NRKMnuGEANYQfweAyi/tx6Kzvzo5Gg3pAy3HjVxJtoiB2H9/PBC2c0nTAoHRxqPlGHYUwS/aJlu4roWuJY0vFsIwi2L2GmBYDskJgYjOFtup07BcpQ9OzAOoxzk7IMVz14LxcHasfYYJuXQ2lDhqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJCj7FBk; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJCj7FBk"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb4d532e65so3717863a34.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784537744; cv=none;
        d=google.com; s=arc-20260327;
        b=YkxFGBD09ejxEeV2kHJWYg33iw6TDBCqu1Tp3tUharNPqme+Tqz2IBVRcQ3UD+LN4I
         79bL4H5AJBbSussfR851g8vGJoM//KblnU48zwdaphDSW0LhMys7pnNhE2oadCPsoh2b
         lK8FkJbnUZlHlKCi1/DXki0DPiwSx8z05AHG/Oa50hTDLqsFl2Ebu16Im6lLA+pYB+kn
         2M/6+yHxE1lPXzTOwRWgs6J3NwZ+BGw+lzBdI2wgjjENOfhJNbckscsYz8A+Aqlkhea2
         Xw/PWYL6Pwsyhv9ghKZituedjkEpigVUDV9Wttvy3NSTCOkg3vKTSmRBAYqotyHAi2rm
         Wogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fmPo3YI6uCHOrEltD7Nq5KoHM5BVX3BZmTMqwCweE08=;
        fh=181YcCaErmwtApfgcJlQhBMqRc8MnTeW7Zf4qH8Ossg=;
        b=KREq51ILC17BYhHgJXL0Rw9jyHeXqZCSymvOBAQ53/owO+Ms9G23kRtE+sS9gnLPSY
         7wHxyxDJb0CUdG6Cs7K+3uN9rPwicwk65U3ZLOLb+mH5O5f69DRBsIsGu7QOki4WRgcB
         /kw0baxjL7h/KM4q8Ss7G1UMvo8Ry2Q1l3AOsvUUfbWn8K7LnIYAaOYil9v5d8OH6bfE
         UiKj1BO5nWMJp3aEI402gJblBc8HQ9ZuQJ0NlKMRIiJNtKHMvjy/K3Jn+jtsjbK3U/2N
         b9DZz8H5ljNwTl2baQlDTFLiFV3blGNnXpoBEaKfJ/dfY7R8XFRwz07a5wrkHOhkmath
         sB4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784537744; x=1785142544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fmPo3YI6uCHOrEltD7Nq5KoHM5BVX3BZmTMqwCweE08=;
        b=pJCj7FBkyDDKcQlaF5imLbb8vWPqGWMx5qgoPnSP+z3KkFFI32H8289VpME5fKAESn
         2/O70qi2tpwYzrq4drZvjvroylIhRV3QeNh+B6arTztT+GRezVvzuheoN/+H80n5UH5D
         d1uvxw5H4qhy2BNgusmyBD5kv/XcCpbl4OlO/7jnO3efQmjBJl03EG1XuGf8wZGyldZo
         4Pq169Yf2O2CQ8nJtPmQXH699cTdWysRnxxqihl/pAomEw+6Z3eRo9JDIkHNBWFSoLKA
         Oy8MbqXZftVvTFrWxG5KXcCj70FJn0ESgHEp2YWLjmrcmfqIxi5SIVCG+dUQzCVd8srE
         3ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537744; x=1785142544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmPo3YI6uCHOrEltD7Nq5KoHM5BVX3BZmTMqwCweE08=;
        b=A2YjWhrgUjfEBmwMw4gF1S/ojhxo6OMf351tuej3iUPQMjyzhp6Ck7aw3EuSmahyfp
         XrclDUxkjszakEogwjqHan3MllyIlaidEwP2Rd7N4LsrBW8NjWNv7RPBYwleu43TIuRJ
         zu/a44P9GQxtnKZJMTJ/xbf22TgFyV9v2e41F8LAb+OCsZojDh1caXBkspFaexvEI5BM
         mLtEWRhJnPAVBYXAtjIfu9Ht9/hBK9/8fZnTZAvf3C+X1KN+EZZ3V0cGeyWaWBXiMmgq
         Xm9eeYNZDqZHihW4DIyQwXOwYkOausXFrETZrbEAAKBKAH1NitgXqEPn6CF612ic8Ag6
         ATWg==
X-Gm-Message-State: AOJu0YwgEF0XRq/r+CuY2t9rhI/KkQEB5jG3m61wF+o/Djh/fQCmpGwW
	UvYhej6X8N7i03rcGEreoG4xPoiDGEyfmSJDW+ZZVOtCJBXJjbimQH5uyNAis0WGrQsU75RA44o
	r9Y0vvW5XqSfHcgu2wo5mD+pZaVfXINA=
X-Gm-Gg: AfdE7cmRrg0Oa4wvsAp2iVH25In3oHGsNw2r5osauZMuXc+7kQVs1AzWd9+CULaOcyc
	3KMZ3feK/P83AUGpKXfV5KQN9tuKybK4xLi3uy7wK3t6t2mXTUMZ15iT/6a//k8OeAoLnAjXhRo
	i9kg4Z7GP8deiNtJ0qLPdEuhVg3Fqk/BXZ0/HfrMn2IkFHG0f231PfD7quMr9ZYHyuItUL/7G2i
	0CcTEcTCBWLFiuj/Q5pl/RsSIM9IkK2wlcK8yr5rJxO/G+ruiY1wxP7EAd69UihRLqH078wNqU6
	Ff90TZD86RhdKQw=
X-Received: by 2002:a05:6830:7105:b0:7e9:5022:3639 with SMTP id
 46e09a7af769-7eda0e6e810mr7927130a34.15.1784537744252; Mon, 20 Jul 2026
 01:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <6a57fbc2.20aff8f6.286553.85fe@mx.google.com> <alk8iQCjTHcdhbVs@ashevche-desk.local>
In-Reply-To: <alk8iQCjTHcdhbVs@ashevche-desk.local>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 20 Jul 2026 10:55:23 +0200
X-Gm-Features: AUfX_mz1ruRruzodLXqUilutbk-gdifuwtgsYNYnPYUdw2zmQ75BNrgP8-2c928
Message-ID: <CAPybu_1h+dKxzst-GJgJRrJfhxUzEkmhn0wWu6KYH+6L_3JUBQ@mail.gmail.com>
Subject: Re: [v1,0/7] gpiolib: kill gpio_request_one()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, Linux Media CI <media-ci@linuxtv.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy

On Thu, Jul 16, 2026 at 10:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 15, 2026 at 02:29:38PM -0700, Patchwork Integration wrote:
> > Dear Andy Shevchenko:
> >
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> >
> > # Test media-patchstyle:rc core
> > fatal: Not a valid object name 8dac27bfa2f9
> > /builds/linux-media/users/patchwork/include/media/rc-map.h:265: duplica=
te value for rc-hauppauge
> > rc-videomate-m1f.c: name #define RC_MAP_VIDEOMATE_K100 does not match r=
c-videomate-k100
> > /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/m=
edia/rc.yaml:125: expecting rc-rc6-mce found rc-rc5-tv
> > /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/m=
edia/rc.yaml:126: expecting rc-real-audio-220-32-keys found rc-rc6-mce
> > /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/m=
edia/rc.yaml:127: expecting rc-reddo found rc-real-audio-220-32-keys
> > /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/m=
edia/rc.yaml:128: expecting rc-siemens-gigaset-rc20 found rc-reddo
> > /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/m=
edia/rc.yaml:150: expecting rc-vega-s9x found rc-videomate-k100
> > /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/m=
edia/rc.yaml:151: expecting rc-videomate-m1f found rc-videomate-s350
> > /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/m=
edia/rc.yaml:152: expecting rc-videomate-s350 found rc-videomate-tv-pvr
> > /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/m=
edia/rc.yaml:153: expecting rc-videomate-tv-pvr found rc-videostrong-kii-pr=
o
> > /builds/linux-media/users/patchwork/Documentation/devicetree/bindings/m=
edia/rc.yaml:154: expecting rc-videostrong-kii-pro found rc-vega-s9x
> > /builds/linux-media/users/patchwork/include/media/rc-map.h:312: rc-rc5-=
tv does not exist
> > /builds/linux-media/users/patchwork/include/media/rc-map.h:339: rc-vide=
omate-k100 does not exist
> > /builds/linux-media/users/patchwork/include/media/rc-map.h: missing ent=
ry for rc-videomate-m1f
> > errors: 14
>
> What is this?

Please ignore. Media-CI applied your patch to the fixes tree instead
of the next tree and "fixes" has some issues with the rc-checks

Sorry about that.

>
> > Please fix your series, and upload a new version. If you have a patchwo=
rk
> > account, do not forget to mark the current series as Superseded.
> >
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/1050=
65189/artifacts/report.htm .
> >
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-a=
ll
> > to this message.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>


--=20
Ricardo Ribalda
