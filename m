Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDBF329E46
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 14:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927941; cv=pass; b=fA5E8UizNUn8cqYMXsGAXw378UDVkXiQY1iBB7b8rQuNrhlGhVr5X1VCR6vpM8VgRmHn6ef+g7mxj24fA2HujCoFiEYCFpgtEFO7MBz1FFYHpP+IH68J48a1eZ57+NxwIzhZqxFNll4EXzY7KWEoFyiYHZWJ3ptB5xMV/mARmWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927941; c=relaxed/simple;
	bh=v+QhT034rlNxvNQJ+DmiwKf1LGZPFhZD1lWgeYFTQLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6Cn2riNui5yMYmfaXBeGrLNQ+jXT6G36bAwPrWh48642AVOOOxnuFWP08C57Ae88N/6Epll0fEoSv5TaB6U6og/AwsGhxXjA3Txl4/TZ7QSlMDr/oG7bfJzv7li4BS1rmWl8WK4bcA4NtNcySbRBXvaZIQYzWzTp3N1DBkpBxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iWgKtKUO; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iWgKtKUO"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccdf36f63dso126145ad.0
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 07:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787927938; cv=none;
        d=google.com; s=arc-20260327;
        b=i7dB82chhm6gyJrH26QDVkjl75TnZ4vAI59dF8al+zkAZ6mgO48cZlu5YSnODWc+df
         UPru2ScTkHq5xni4hhTmSx9poTNdPNImbOpVTgOe/xqq/xoLWzG+liLFzIrXEUJhT+f1
         ddzYPyPu7DgYfMCljLqjtXFEBggpJ+Ik/8FEf14CSkVbg8WK0ILAph1ohyPwccDiZDot
         fLNjQ5FNepK3F1B/JYAOakjtTjbhMyFzo7bligIraC1myuHs03ZjUzTQTWhEuDeTMKYw
         YoS0k4Zm3G1z/e6XTKfn/twZ7wzQo4PqOPPeABBhhEvQ2AiPq4JVz990UhulfTwqQCQM
         Y0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TTXB/Ufmyg28R+Lg1AvRjzORD19X3g125IBdKvpkQ4k=;
        fh=C+EjFZ1y9Q4p8CvZEZN9DXRy3HdguU3JHIPCdjy5kTk=;
        b=OUb0CYpWVUucwa6i5Z9QXQZia57PjMu1Z+e/LC1oZCZC4X3Wjow0qQNRK7Wp7YAMAh
         AfjmOqL//mMG5BFlHEzwnxCEjgUZGHY9MUmStRaeNYW/xdYFOe/5FNIZCg9X5bkAsKDB
         oXCUzBaEHWVevtAtdGpP24BYljQIDQ6sj9Yeg4SJLVr0qlvorKuPTeiDFZM1UYPw2Hgx
         G8irYgYA1vbS1195dh+tUInIQ6M2csCjJrbuNfFNvyh3JryC05C+Urtd3x7zMkLMiP0c
         GsNuskT4ksWTQf+3kqTStIKLR0qWhxPTbKHGeUl3bWLyRcXV0TwyWIfI1haGW2hQM5ZV
         JfuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787927938; x=1788532738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TTXB/Ufmyg28R+Lg1AvRjzORD19X3g125IBdKvpkQ4k=;
        b=iWgKtKUOAqb7XoF8zTjxOPEN8LKoQtGdJ8X0EJdPUeEAcb12b3RTy5e5bUnjBE1NCU
         hp6fEpK/Wc4QtV5XEToHpd9CWJUaI5hgiKTvg0g2j+uNkL+Tqp4IF62NG0b6GkJ8x6Ps
         msg4nHRH05pi5lyOr8qi9YnytsqUFqPo5tB2yG6JKA27rYPrIapxtDJHmsRXbYZXBV/h
         ChoLvd+m7NIqLTJFz7RWFsQqsnr4MzB3QParp0HrSySgEt0np59oyvUs5Q0AwisjEpl8
         oFDQ6tpRuK2QPTlBP7Qk0vY3hvY4e9FbptYPhwLefL3Fj1ygbR9VIytjEJG6lJWIpvKW
         pWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927938; x=1788532738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTXB/Ufmyg28R+Lg1AvRjzORD19X3g125IBdKvpkQ4k=;
        b=Uz0EEGA0v0Q0GCQgJgS/KrqtCvV62J9FTd6lyzHHJCy7ZmAibkrdJl7d32AzELVhQY
         S3nMW2L9smNClYaKa7a3eglY0VjDc3pWoxFNGv4JLShiCFtdhgtXpOXMB8T7FHGTv5/O
         Tt5l+8cgTimP0q4o90rQm9GUixeaiIfHpxuwGo93iRLWBM8+GdkWHYxpXlojXU8uE2GF
         3uKYeOVCNoz1Sgo2ewKnVDjKaW5PQvNtk91GltxjbNPGMbFuOBY4KSFLUl9SGCyivr2Q
         yXZpyOV3634sX4UcsQlbyxr7KfU5dpz1EbQRgW/aH74rx+7yZh1T6dgGpoYK/55UyB6/
         dX7Q==
X-Gm-Message-State: AFuF++k+PvxYOfvLwQVYc1BcAySkv+ndNAsdEiHUZvRkl81d9SI+7Qha
	UyYHADDcNU3dMPZoQCJmTsU1HwBJT+4NTQGHhExYhCBQ06T+QfRRyxbcOsa/dtpcaGbL4lfSBTq
	LwkZjM0UUJ0pgGrvuBivLt4P1ejzsSo/JIiyPANtMG1JOZjZTJKk1QMY=
X-Gm-Gg: AR+sD12b3ggEzyo4lL5GZpIFRZMyrn7FtUfQ0boow4KTp2ettYiGIWdSn2MAOS9a6SL
	aDr4FBQYLK+Bx3txJY9i1KrF3Z1ZQfrA7JgFFU83fbmXAzUL73/gA9Wc4ys1DlhlDpbNdzYA9CS
	9MR4CFWrQRaFIHE1Gn72SKC6NqTTbqdD8xgsIBUakLK+g1UMi1hPL0LdSYL7ugI4rzMkIp0jXQr
	Oqzi4y+x8o7YiYebCX8L+2mOWzqOuMHuBjOjhPE6jdcQPp0GbSp0of5xvYNnD3catQzRU9WV07K
	iFTJrc83+Q/x9AB28l13OyAwFK3bAlBroGqqS0cSZRk=
X-Received: by 2002:a17:903:987:b0:2c7:b1e7:501e with SMTP id
 d9443c01a7336-2d75482c43emr6247435ad.3.1787927937787; Fri, 28 Aug 2026
 07:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528163448.4031965-1-briandaniels@google.com>
In-Reply-To: <20260528163448.4031965-1-briandaniels@google.com>
From: Brian Daniels <briandaniels@google.com>
Date: Fri, 28 Aug 2026 10:38:46 -0400
X-Gm-Features: AcwNN1WdcCxOIUuI3wMMSoj8nvMUa58C0FQFRZuDPdxYDnoAj0xIB2h0Ul8mlX4
Message-ID: <CAD4i_GRm4=0vTkpnwx6yrcha1YTgeQR0H39JRqi0PZN4TxwqUA@mail.gmail.com>
Subject: Re: [PATCH v4l-utils] v4l2-compliance: Add an option to override the
 driver name
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, hverkuil+cisco@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CCing some more people to hopefully start the discussion. Thanks!

On Thu, May 28, 2026 at 12:35=E2=80=AFPM Brian Daniels <briandaniels@google=
.com> wrote:
>
> When using the virtio-media driver, the host and a guest VM are used,
> with the guest VM proxying requests to a host device. The driver name in
> the guest VM is reported as "virtio-media", when really its proxying
> requests to a driver with a different name (for example, "uvcvideo").
> For the test to pass, v4l2-compliance needs to know the driver name of
> the device on the host because it changes its behavior depending on the
> driver under test.
>
> With this new option, the name of the host driver can be passed in on
> the command line so the test running in the guest can adapt accordingly.
>
> Assisted-by: Gemini CLI:gemini-3.1-pro
> Signed-off-by: Brian Daniels <briandaniels@google.com>
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp | 17 +++++++++++++++++
>  utils/v4l2-compliance/v4l2-compliance.h   | 15 ++++++++++++++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compl=
iance/v4l2-compliance.cpp
> index 4e5c9d00..ddb4e7a7 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -52,6 +52,7 @@ enum Option {
>         OptHelp =3D 'h',
>         OptSetMediaDevice =3D 'm',
>         OptSetMediaDeviceOnly =3D 'M',
> +       OptDriverName =3D 'N',
>         OptNoWarnings =3D 'n',
>         OptNoProgress =3D 'P',
>         OptSetRadioDevice =3D 'r',
> @@ -87,6 +88,7 @@ bool exit_on_warn;
>  bool is_vivid;
>  bool is_uvcvideo;
>  int media_fd =3D -1;
> +std::string override_driver_name;
>  unsigned warnings;
>  bool has_mmu =3D true;
>
> @@ -130,6 +132,7 @@ static struct option long_options[] =3D {
>         {"help", no_argument, nullptr, OptHelp},
>         {"verbose", no_argument, nullptr, OptVerbose},
>         {"color", required_argument, nullptr, OptColor},
> +       {"driver-name", required_argument, nullptr, OptDriverName},
>         {"no-warnings", no_argument, nullptr, OptNoWarnings},
>         {"no-progress", no_argument, nullptr, OptNoProgress},
>         {"exit-on-fail", no_argument, nullptr, OptExitOnFail},
> @@ -255,6 +258,8 @@ static void usage()
>         printf("                     then this defaults to 90%%.\n");
>         printf("  -E, --exit-on-fail Exit on the first fail.\n");
>         printf("  -h, --help         Display this help message.\n");
> +       printf("  -N, --driver-name <name>\n");
> +       printf("                     Override driver name with <name>.\n"=
);
>         printf("  -C, --color <when> Highlight OK/warn/fail/FAIL strings =
with colors\n");
>         printf("                     <when> can be set to always, never, =
or auto (the default)\n");
>         printf("  -n, --no-warnings  Turn off warning messages.\n");
> @@ -1026,6 +1031,15 @@ void testNode(struct node &node, struct node &node=
_m2m_cap, struct node &expbuf_
>                 printf("Compliance test for device ");
>         else
>                 printf("Compliance test for %s device ", driver.c_str());
> +
> +       struct v4l2_capability real_vcap;
> +       node.querycap(real_vcap);
> +
> +       std::string real_vcap_driver =3D reinterpret_cast<const char *>(r=
eal_vcap.driver);
> +       if (driver !=3D real_vcap_driver) {
> +               printf("(overridden from %s) ", real_vcap_driver.c_str())=
;
> +       }
> +
>         printf("%s%s:\n\n", node.device, node.g_direct() ? "" : " (using =
libv4l2)");
>
>         if (node.g_caps() & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTUR=
E |
> @@ -1811,6 +1825,9 @@ int main(int argc, char **argv)
>                                 }
>                         }
>                         break;
> +               case OptDriverName:
> +                       override_driver_name =3D optarg;
> +                       break;
>                 case OptColor:
>                         if (!strcmp(optarg, "always"))
>                                 show_colors =3D true;
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-complia=
nce/v4l2-compliance.h
> index 4a7af5f5..563075c6 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -311,7 +311,20 @@ static inline double fract2f(const struct v4l2_fract=
 *f)
>         return (double)f->numerator / (double)f->denominator;
>  }
>
> -#define doioctl(n, r, p) v4l_named_ioctl((n)->g_v4l_fd(), #r, r, p)
> +extern std::string override_driver_name;
> +
> +inline int wrapped_doioctl(struct node *n, const char *name, unsigned lo=
ng cmd, void *arg)
> +{
> +       int retval =3D v4l_named_ioctl(n->g_v4l_fd(), name, cmd, arg);
> +       if (retval =3D=3D 0 && cmd =3D=3D VIDIOC_QUERYCAP && arg !=3D nul=
lptr && !override_driver_name.empty()) {
> +               struct v4l2_capability *cap =3D (struct v4l2_capability *=
)arg;
> +               strncpy((char *)cap->driver, override_driver_name.c_str()=
, sizeof(cap->driver) - 1);
> +               cap->driver[sizeof(cap->driver) - 1] =3D '\0';
> +       }
> +       return retval;
> +}
> +
> +#define doioctl(n, r, p) wrapped_doioctl(n, #r, r, p)
>
>  const char *ok(int res);
>  int check_string(const char *s, size_t len);
>
> base-commit: f2a3cb8a59bcce9ac9f7a7c5b71429610d638a12
> --
> 2.54.0.794.g4f17f83d09-goog
>
