Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF2387596
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 19:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376038; cv=none; b=k6ILFI42Gc98JBZPWSk/+z3OlQFcRnfCYA5glp3e9wZS8kGFhuATaOoEzrUnJtLcr9Vk2D9Fe7uw8QWzoRXK42aL+GBlubm1EgjmUwSEZ8LNf73fCvkuihlQHiypRn2h7X5Q5Nk1VlJ701H8NATtuMfo23DHiVUdQ+Rdq29MMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376038; c=relaxed/simple;
	bh=nxFfLJEH5Z8mej9+3FHsOCMvcblGiMlW3FOcgBd1niA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtL4JY+IS3GAPI2BSJeXpeq/StSZ2yVHKAHCPRwhEdSUT4+BbRMvFI1ZsgFKy+eFWz0nfZMjl7I08t550DPyhDShk8X5uqChmgUVYvK/uG7uVeTNN5z2pW4Z+Nb2EUwYaEnCqBlCNMdOpyxR3wuNNow4C6502R7JxXsXAmVmOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ribalda.com; spf=none smtp.mailfrom=ribalda.com; dkim=pass (2048-bit key) header.d=ribalda-com.20251104.gappssmtp.com header.i=@ribalda-com.20251104.gappssmtp.com header.b=m1nJZyET; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ribalda.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ribalda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ribalda-com.20251104.gappssmtp.com header.i=@ribalda-com.20251104.gappssmtp.com header.b="m1nJZyET"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f4cc6797b7so704202a34.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 12:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ribalda-com.20251104.gappssmtp.com; s=20251104; t=1788376035; x=1788980835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=en6yF2IO3MCDR9Sasa5TCm5dpOG2lzwUdb3NqrAe38s=;
        b=m1nJZyETis0OLNgMz/FYu3YEa1mO8xyuk4Stgzx4Oz3lUggwlVuIPr7Yz+44kgGjzq
         98Z7+iF42kKHQJBLeMmz9zX7xX6F8R3Czidz9jqShvKp+4DOtEdiNt4ZEOTLGFy7d4U5
         9Rsosr6fuivdWsBz17YTXU84+vCjm+YE0yS3kPaE3cKMaOz0dD98cXaGoLyGbYWehBNc
         OjZQ/X+ek3B6WRc7zDTM9cpQMYdx2Sdg3zxa8PBWWEMFBHT7aIZ7Wyd44DfK/rkrYePf
         vKNXa6eiDAOmraxMITZaXFeesEMlLZUEN3cpcnXR7GvM5N6WK8czQ2kKymg8tIvCJRj4
         hSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788376035; x=1788980835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=en6yF2IO3MCDR9Sasa5TCm5dpOG2lzwUdb3NqrAe38s=;
        b=UlC0h9QgPSM9M3tCMu0UVP1gTuoY/idFopembpn0eFaOcH85t5lpikXBZnEDgqaMC/
         ERImETN5tc5u5Zvx6vedsPRGNk9TiCZsq6UMadeZUm25M08mbEyxhN0UZW2JadY5LAnn
         2oeOl2l+bWIzNk/bGfKJFxXUFZdhHXMzh9sY4yWPYEOMNRem1aGF915HhxhFTtQD+IVr
         z+A99F44ri9ojB7Zb5+3ULm+9qbhI3PixsmcIsJfcfUuJnWtv4I+iVfhjyW8ai+910pL
         sMjLWzKmbJi6DZqJE3iJMjLButVbweIEhdvePnQVBzLaIdCONJTBH5Z3HR8XpNylkUEg
         XdBw==
X-Gm-Message-State: AFuF++lJLgmVVDqrXmEjCAXbAnKGTas2ZaYaWiG9OV5ElhRfhAYHFFq/
	5soufqZwduGrgbhAxmcyi8lxua+YVewFmXx+wIfOqnnz4qNRmPdtOE/dMVVClcudCwJKt9Pergj
	LgCMdndE=
X-Gm-Gg: AR+sD10c5o6AqF6/zneRu+2+ZCsgSczhNF0kJsWC9ObWnAHzIh6ohMtBUvm00X0idHn
	x1jKC6yTje7BFcRsE8dL1ijpD1b3Zv+bxETCQduccSgTIYMPu7PH7XHb9DYUKaef52mFGDNZbWf
	h2rYCNV7fvvXKaDVpJNZMzToHsgpV02u7EcjifFzQB6Wv7QRjIpt5xe/euS5mML9poMKG1gvrQ3
	irgbMSSoADnZdTuEqIsIfywiXvF8GvGbrOtM0LYfAz744t4SqK4c8K29pqbp86B8NFrkbG/WNhh
	wWZuTt/qXtPOMrDj/ZI0dKOH/Ce1du+Lgvt4EgfiT98nC2o4cN5ggvGh2vEgVO04K5ONBTy8Sd2
	7lu1ZW5AWMsz5muOeCV5SxbvsJHEZbNSeBENOw4rI8KpQn6Bpd/n3KTrjC7zu2/xmigIqhKk71a
	M9H3SoJ76J6RYl0p+2H3aVRsTE0TlFjjd+mQMpTFDtU6iMOewfUAIld8G+ngQITlnDvQMEcTQwS
	Wv5P7cLRI8E4I0CqJPemHZe
X-Received: by 2002:a05:6820:16a9:b0:6b1:445d:aaf9 with SMTP id 006d021491bc7-6b47d4cd775mr4795871eaf.8.1788376035310;
        Wed, 02 Sep 2026 12:07:15 -0700 (PDT)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30cb5a17sm4721218fac.8.2026.09.02.12.07.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 12:07:15 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b1b1cb72d0so601805eaf.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 12:07:13 -0700 (PDT)
X-Received: by 2002:a05:6820:f013:b0:6b1:fe93:3a69 with SMTP id
 006d021491bc7-6b47fb291fbmr5170073eaf.24.1788376033279; Wed, 02 Sep 2026
 12:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902080128.1286050-1-sakari.ailus@linux.intel.com> <6a983846.bd8478ff.19809f.007e@mx.google.com>
In-Reply-To: <6a983846.bd8478ff.19809f.007e@mx.google.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Wed, 2 Sep 2026 21:06:55 +0200
X-Gmail-Original-Message-ID: <CAPybu_2Yk2Qt6BjH9JEmxc=t57Mac83xUGxGzcjycXRaNjB8gQ@mail.gmail.com>
X-Gm-Features: AcwNN1WRkR970TYZvpQP4zS4PnEqrqEr1FCX6lx7lxmBBmeRtF8tkeGv9cC3xG4
Message-ID: <CAPybu_2Yk2Qt6BjH9JEmxc=t57Mac83xUGxGzcjycXRaNjB8gQ@mail.gmail.com>
Subject: Re: [media-ci] Re: [1/1] media: ipu6: Add a Kconfig option for IPU 7,
 7.5 support
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Linux Media CI <media-ci@linuxtv.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari

On Wed, Sep 2, 2026 at 5:30=E2=80=AFPM Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Sakari Ailus:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test static:test-compile-all
> Unable to build VIDEO_INTEL_IPU7

With your patch the CI will be completely blind to the legacy driver.

Could you add a Kconfig rule that enables compilation of the old
driver if COMPILE_TEST

Thanks!

>
> # Test checkpatch:./0012-media-ipu6-Prepare-mmu-driver-for-hw-variation.p=
atch checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #56:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 0 checks, 964 lines checked
>
> # Test checkpatch:./0013-media-ipu6-Add-ipu7-mmu-support.patch checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #112:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 0 checks, 825 lines checked
>
> # Test checkpatch:./0021-media-ipu6-Add-ipu7-fw-start-stop-functionality.=
patch checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #20:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 0 checks, 463 lines checked
>
> # Test checkpatch:./0022-media-ipu6-Add-ipu7-fw-com-methods.patch checkpa=
tch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #33:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 0 checks, 135 lines checked
>
> # Test checkpatch:./0023-media-ipu6-Add-ipu7-fw-isys-ops.patch checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #216:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 0 checks, 856 lines checked
>
> # Test checkpatch:./0024-media-ipu6-Add-ipu7-csi2-register-definitions.pa=
tch checkpatch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #16:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 0 checks, 1189 lines checked
>
> # Test checkpatch:./0026-media-ipu6-Add-ipu7-csi-phy-driver.patch checkpa=
tch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #133:
> new file mode 100644
>
> total: 0 errors, 1 warnings, 0 checks, 1164 lines checked
>
> # Test checkpatch:./0044-media-ipu6-Add-a-Kconfig-option-for-IPU-7-7.5-su=
ppor.patch checkpatch
> WARNING: please write a help paragraph that fully describes the config sy=
mbol with at least 4 lines
> #28: FILE: drivers/media/pci/intel/ipu6/Kconfig:20:
> +config VIDEO_INTEL_IPU6_IPU7
> +bool "IPU 7 and IPU 7.5 support"
> +depends on VIDEO_INTEL_IPU6
> +default y
> +help
> +  Enable support for Intel IPU 7 and IPU 7.5.
>
> total: 0 errors, 1 warnings, 0 checks, 27 lines checked
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/109297=
477/artifacts/report.htm .
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
> _______________________________________________
> media-ci mailing list -- media-ci@linuxtv.org
> To unsubscribe send an email to media-ci-leave@linuxtv.org
