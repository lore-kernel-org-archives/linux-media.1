Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556023EFFC0
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 23:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895780; cv=pass; b=BblaKSiROtUVmy9hnqYWGdLt3aM7sXEPBf8jnicUAI6fZe3oxOs5s/tmmXhg8gyDrmNo4yT7LdAMtReM6zzIVIVbgZhU+qQ3BdkWAy3vGD/8rDxIJWts/9ywWzGf813Ofvf/rcmcDK0mqg7ORDYiyXM+CxzlbSakTXoWG8mGKyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895780; c=relaxed/simple;
	bh=GSPz6lNi1VEpA/4xAN+CTCqpQey0mPtqaK5dSSm5u0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=boO1y752dL1DthyFT+PgCfBX7D5EgqTXxw8mdcIv5ist8k/3uvM+2Qv+sD6Ybr+b3Zf+xLaOg12xfIEI3oUtsVNsE9KKKcivJ5cKOaYCyENWrDCMyXfMVEaKLEF51xyLByx2RJebqnQzF6HB2OQic6h++5ryUoMeOC4SdRkbIfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJHEXlfj; arc=pass smtp.client-ip=209.85.167.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJHEXlfj"
Received: by mail-oi1-f194.google.com with SMTP id 5614622812f47-4b28d9537bcso758572b6e.0
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 16:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790895774; cv=none;
        d=google.com; s=arc-20260327;
        b=ANCE1866GvtACpPA03MOekSLqOEzK1SoGe7j8rmR7wPZSGSgCvIqSBKQDS8rCcZYo7
         72XdKH+hjSpd4HCoq9Uhit75s6DOS4CcQI5VzR6tQunM3uvhDyW2Qh5TEbGbQi6YMV3x
         UGlWSZud+C5AAdKsi2R7rQhDz+evNQQtnEpff2yc86QF3Tx3tdk7OfRvpNTuRkiN9Upo
         2yl1rVsImVZVU3HezUkR9w1SkHqE4hWc6jqsKIcpgA6SqsBOeH9Web9zvGCvuRWxEWhH
         oJqv8Qr0/16vL/kau83Lfu69ZV1YnhFf4hwOwCT+4039/veWGH5ILNx0HVNvX3xbbe0e
         9qrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lq1IpFmDlDgG5sD+4IjWn0mvnDPiTx45p//Li+dS8Nk=;
        fh=RIYe0QDGWhunDH5UlIWIsO+hypL8Z7HWjVTdhmeZOiQ=;
        b=L4OHtQkJB4nJqghBZG2HF2wh4UKladaQ4kvqvm5cP0nTM0Qy8lWnHRiow1N4xjFZ3h
         39717oYdueTaItHBp4uWtDNajcAh9hf8O75VnsJkzyT6a/siHiHds7f9DY6jk2CrsZgZ
         n4F4o86g211JydSzKCcBjZHN8A/bQVkpNI7zwCdlVPPjxqmcxD8H27qbhVhpHEnEZeb4
         gZmpTocCoUknqvqxPrDCLds6cZFmYmCEQcuqk7mp94jZxc7XHKd7c321HBWCEGHhUkon
         k4FGp4tzl2/wwqgpReKBwNWjIAuXS1S/Zxy9ePtpy9t5eMeE4ikVFYFJ2E02zpliZHgy
         tvBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790895774; x=1791500574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lq1IpFmDlDgG5sD+4IjWn0mvnDPiTx45p//Li+dS8Nk=;
        b=KJHEXlfjzgsTNDvsiCSozuH0Ve9EgtbVHd7/lUSARngOzjJAz6/e31H1WSjgqUpCu6
         H9gvQuhQMn7gSuh6ZxYmysrxKOyjtMTvbeUo77o6cGancPBQVMXWQL5Rxi122H7VCyqz
         H3aYldeQwsmUhh/8tmGSCJf58z8ChWlhBPfo1tCIDno2Jwss0lxSy3sp/+K66vD6KCXw
         8CtVh0PeLnvGMn4tBEqHxtfYO/mOMsXrP8ipSokLeHdbuhukGo5ZOgYKeasA6E6t8/0u
         +J/KTntIofeSg+w0QAQ4azCA4+AdifqpR79fPYgActMAid+1jL6YKcXfWHkHv5Ekrbx2
         UKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790895774; x=1791500574;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lq1IpFmDlDgG5sD+4IjWn0mvnDPiTx45p//Li+dS8Nk=;
        b=TfdTTg8fdgoqJMxyuFn+ksNGnympUe4SWH5571Lx50QGZ6CJG1zsKMu5ufQgfCpTag
         deRq/NCVoHkiuLgy7wFrN+7uFphyn6EuZ89giYU84vISD8AgpNnIj1+qRSaIzNysDRp+
         dNWuAjnsp+6HRZMdOh1wXyH6YMEwAidXULnBIKJTabPL8bKTsO56BtxhgEn2VLAK63oU
         XNLBhSDRFhiWIte+s89ywiNxJT2HdUqB68Ey1yyQIB5rvhCNu2Jik8JClOSUx1SABGQ9
         CI/P/XrHeqiyeHRLlvyzdV7VsZT1BqAf9ygYVNNk6i4WvgBAloT8lSJRRJJFxxYPi+PT
         x5eA==
X-Gm-Message-State: AFuF++nolH3kdIIDWGMJR1Dz5vOrjNfryM0jNmMrRkqKmFsQbBA4uY6z
	BEI4tFnmBVqMwekMEADjHjnPA70wVy3R8Rr0emaa0LqvxO5ZhwnWe2t/yq4Tl6JssoCvHBoDzQd
	X6YvNmXTMvF3590vL2DN8dMKl50hjP2aEHV/ybSsWhg==
X-Gm-Gg: AYBFou1iyo2o32Rp1ZsXLDfTYp3m6X8JEI+0D2Dk6de3bmczierBBDOHnaYGTTNBz6k
	rPxktLampE1ZnpNOStypbTZvRjBaLSRNxNgpTTybdTJtNVpSDjfDyNJcrFL3jh66ldRGi6NfEo7
	LRbGDuTbMrodTkG5rHxbWov8bu5enhqCFA7On94NjACFFLpxR+gu4GPHockpal8rNAgULYYaJiI
	bwTZAswRcBBdi1vz2Z6UsGVtWmQF06NdsEmhBQ6WmmMUz6ta0D7G//cZBbSs+rmTXklMX9sPfVR
	A01PB+CCwDM1oWBTh8Uuenx7hVXk74avf1aBc9uQLpZrLQlQkvtnQsCgV0D9GXek1TKcHUNIUvp
	gCON53X6wWdTnuzc1Lx6EceeD
X-Received: by 2002:a05:6808:4f2c:b0:4d6:9133:cfe7 with SMTP id
 5614622812f47-4f30c1c555dmr4506466b6e.44.1790895774078; Thu, 01 Oct 2026
 16:02:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001154436.20798-1-dennylin0707@gmail.com> <6abe9325.08f94d98.6f30f.894d@mx.google.com>
In-Reply-To: <6abe9325.08f94d98.6f30f.894d@mx.google.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 1 Oct 2026 16:02:40 -0700
X-Gm-Features: AclHuK-qgZru4MIB9vIGw8FoyRLEgWgTrcOdkdp9FH8JKVTRgbsTu6KWFGHeVhM
Message-ID: <CAGEkeHcRBF_SsXYhzsRqzpXe-bWCEGB6PYuxhS_MOXCuJWbZsw@mail.gmail.com>
Subject: Re: [v8] media: qcom: iris: release OPP constraints on VPU power-on failure
To: linux-media@vger.kernel.org
Cc: Linux Media CI <media-ci@linuxtv.org>, ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo and Media CI maintainers,

Thank you for testing v8.

v8 was based on media-committers.git next at:
c6fb304dc0253584cfcb93b6b97970c36850910a

The CI-applied commit e452a7481f23 also has that commit as its parent.

The ancestor log reports "Not a valid commit name" for both the
next and fixes tips. The checked next tip, 4a069a763e8a, is four
commits after the submitted base, with no changes to the two Iris
files touched by this patch.

Could you please check this ancestry failure and reapply v8 onto
the current next branch before running CI again? Please let me
know if a rebased v9 is required instead.

v8:
https://lore.kernel.org/r/20261001154436.20798-1-dennylin0707@gmail.com

CI report:
https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/11157506=
1/artifacts/report.htm

Ancestor error log:
https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/11157505=
4/artifacts/junit/test-valid-ancestor.err.txt

Thanks,
Hungyu Lin

On Thu, Oct 1, 2026 at 10:06=E2=80=AFAM Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Hungyu Lin:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test media-patchstyle:test-valid-ancestor
> ERROR: This code is not based on any of the branches: next fixes
>        from https://gitlab.freedesktop.org/linux-media/media-committers.g=
it.
>        The output of media-ci will not be reliable, and the code will not
>        land upstream as-is. Please rebase your code.
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/111575=
061/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>
