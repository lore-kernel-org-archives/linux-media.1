Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295A93B8D78
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 17:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360455; cv=none; b=XAEHLGPcQNJxRGf9Dtxo8iVMAyKf/CnmqzxE0GnZZepZrh7Xw4U3AhSSR71yPkJCVo7waWItWCIcb0rsSLpfkO4qWiVWNkkC19VUyn9s3ofA+2Kv+8XoRaS7DFFttvnx6VmhFABjmLoMmo7C4KmZY2f/PUCiY2zLtyyz4/VnRZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360455; c=relaxed/simple;
	bh=L0a/JVnmmmNHaLbMmS/XuNQegCicS9unVKtFy4uZ328=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+iYDuF7mg4kv5K2SObto90U1ColjOrpa9WOei6F0XSTokgKqqyO3f4O72ci2l50QiGEyOeOE8L6X/O8g8pF9nH4wveVQhJTBIVab1Sa5RZa2mbXsshnxQBOyggifZXz1467Ku5JTKUz+JDf3oR72iZgyrekwwJ2Q+NESyoOpls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtMSs56o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtMSs56o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00A81F00A3F
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360453;
	bh=6enyA2VOl94npqeS70pB2WynRamNQvIajAYAXJPAThM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TtMSs56oqd+XLpaBrEbBiWLnGz/oxobOwW0T58swLIu4XQbutFjbS1atsyFDX1VJF
	 3XO+8vF3vP37wO87FIn907DKCoM7NiCRXxzG0VGEU1zuQhglFUYzqnXvSpCymbjmXb
	 x+tNqnLX0ZNJAd/pF12BB0HRmkE5AF4Wg6JkGoIlPbp6QHPXrMqb5qUk1nmn2yLrkf
	 s7avTuwf0Z+i32EJp8ZqUK8NTQpglRte3UKZlfKexUQlL2i5jJXoScfXYLBgFgxpgi
	 /6finYzTSyrbfSSBM/06a7rPxSzPLQYInYD+sNbeVZTPwkZjvUJevstMgnuXxatg0R
	 X3d+TkVFxDx+A==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeba09900bso2665116e87.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 10:54:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpHsbk7WPDZu7klr+Ki9Z653yeJd+n2zvD9e7ZgicO5EQKIPHE6TlGQO/CopPwEsNf0sIXENQvMC52DdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPISgleRWC/KP2jBiE+9fDZOfZWMyJySePX9eZ9QdkwHMoWpV7
	GfYnKY+tWyrBfaXO2K8PTVNrT+uJQ5g9kVricEJoX49pDXxlea9w1xg3LXv014PiPrOElSGUv8a
	b3rMs1J5PfVfJhtn/iLYuNzXmow9lieI=
X-Received: by 2002:ac2:4571:0:b0:5ae:bd66:553b with SMTP id
 2adb3069b0e04-5b007c4ad98mr221540e87.38.1783360452258; Mon, 06 Jul 2026
 10:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704171855.1462214-1-arun.t@intel.com> <20260704171855.1462214-2-arun.t@intel.com>
In-Reply-To: <20260704171855.1462214-2-arun.t@intel.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 6 Jul 2026 19:53:59 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iBs98Rkyardw-XjKEpi=2s8cWqb0_RqUL0B-KKoNGu1A@mail.gmail.com>
X-Gm-Features: AVVi8CfN30vH_2tW95Q_UrGvsz691aKjHu-ZQWcPNeBdz1YuJpPL27V5R37MDRU
Message-ID: <CAJZ5v0iBs98Rkyardw-XjKEpi=2s8cWqb0_RqUL0B-KKoNGu1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ACPI: scan: Honor ACPI _DEP dependency for NVL CVS
To: Arun T <arun.t@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Miguel Vadillo <miguel.vadillo@intel.com>, Len Brown <lenb@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mehdi Djait <mehdi.djait@intel.com>, 
	linux-acpi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 7:24=E2=80=AFPM Arun T <arun.t@intel.com> wrote:
>
> Add INTC10FA to the ACPI dependency honor list so the CVS driver is
> loaded before dependent camera devices are probed on NVL platforms.
>
> This matches the camera dependency handling already used for IVSC-based
> platforms and ensures the camera streaming path is initialized before
> sensor access or pipeline setup depends on it.
>
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

unless you want me to apply this patch, in which case please let me
know.  Otherwise, I'll assume it to go in via the media tree.

Thanks!

> ---
>  drivers/acpi/scan.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 9a7ac2eb9ce0..21937912a1a5 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -862,6 +862,7 @@ static const char * const acpi_honor_dep_ids[] =3D {
>         "INTC10DE", /* CVS (LNL) driver must be loaded to allow camera st=
reaming */
>         "INTC10E0", /* CVS (ARL) driver must be loaded to allow camera st=
reaming */
>         "INTC10E1", /* CVS (PTL) driver must be loaded to allow camera st=
reaming */
> +       "INTC10FA", /* CVS (NVL) driver must be loaded to allow camera st=
reaming */
>         "RSCV0001", /* RISC-V PLIC */
>         "RSCV0002", /* RISC-V APLIC */
>         "RSCV0005", /* RISC-V SBI MPXY MBOX */
> --
> 2.43.0
>
