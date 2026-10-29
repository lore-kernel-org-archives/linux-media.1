Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793287962;
	b=bCT6bEGUI3zTNfpa0zWIY61TSqLx3YoCLynRf5c0B9f5p3mO9JD05uafvO/fiinwIhkS
	 jBV5g9isavGqUGXP8ag1SDAMuy/ASUwUu4OgliIyVNXqAPsITZrtWCZX5L0YqQV5zg73y
	 n9bseoEuX/lGhH6aqin6355Vc3PlQboqQspm/7zgLE82umYWDizWkEafitoebh32JBGnp
	 eH28gW49vMO8SxhmfvdlG4yFfjUatcwu6Xj/cocKhsonfR3APGKhm2qt4e2yY0LeZXNi2
	 cl13QnbCurTF1XgSa+lPydc7ILgRGlePVKYG+3sHS/pUFVqpOUQ58f0E4zFjZ+xP9fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=mgjozZfcfxRUL0L6/Quey9cER2eEb7R9joV0ZOwrsqc=;
	b=ujzTuqTiR+8WbZzl1C5pJZHbiG7GtOIrOaN2evxSpgG1nHLjLu1jd6SgrSzcrhb1uLv4
	 At5vxorbyk1GcNMiFIX+e93tdu6TkQVIzPV55uZ3tCvWe8EfXkAXGIu2W5LS61dVXo/wF
	 iwepkw2j5/lzUhfvF1sx0MOxHCN8xhyKZcv0FxCT07WuqB5U9W5BK/gl6J3+D8X1oMSvz
	 zTLnR3XHv1dVNayv8rQdnkhW21prSouD/jXcshvUfxG+FKNNzoed/vcViWA2pz+GJI4lP
	 csDO0Y/ESY2+fSNhc1+PT4Z61gh6n9Dh5tCJCLV1jCJPfToiMRVod827dZG92AJCmBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UdE+OCXV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5653C606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5653C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UdE+OCXV
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2eb0a52d605so75055ad.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 08:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793287961; cv=none;
        d=google.com; s=arc-20260327;
        b=OrquMRCUncdwz36A83cJF1CfPw2I7zjHtyPclJCfrXOUk9ThIdzKpHs6T+BmqqZ+9S
         Bjxi7EnHcATy94A93paPe3iym0Mi0fme36QeB0gLVHPQnzn6xdja7E4RY1eAxHhMRrdk
         o8dmklcsnNyvGsM4JH08KliduFhjoaQ+9DD844pZmA1aJXzMQoC/koVc+BKLSiBd7VYk
         izuQwWafLHqS2nEOyYF5srVe6c9AZo73PiaH6IQPh7bC1UtklhmhOTQWMlAcpmOrk+K2
         fzkmunq0692RmfmYhl4Eed/VpUw6iifQbIQ9skahaXk/ayciwnqnCDrrUDXG+O1OQ7m4
         /9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mgjozZfcfxRUL0L6/Quey9cER2eEb7R9joV0ZOwrsqc=;
        fh=+/b4jmMhh1qSp4G5F2PYNDLgutuDwJgu47qVyyyTytc=;
        b=j5kAnzoJg2DXx9zaFJBXLHktuA4nK2VVykgDse4xU5+Ibr4RBx9hnPmSAK2m6wlMFj
         EKtyKnI7VWX5m1lF5dcwgkkXtUr4vpk9+pfrx0Si3UaBi4ygiOD+koKvuP6CVkHRvmMK
         2BS10OUt2ElMpD5kdYHe4DQtlJB4I0WeLWIyuqtIgXi/StypHMxdopehT1Q1Dt556soB
         XxfTNrbh8lLO2YY8qnsws4/JtwpIIspINwCgWPmhI1YCW1n5Pz5xwQlEC+rkbwJN1Czf
         HrFag1yLkjiJb2NLEQweoSbgGZ1V7t0PNTe+PutgyqRu/Z2tqVFkt6vP3tjtjHMk+quY
         awBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793287961; x=1793892761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mgjozZfcfxRUL0L6/Quey9cER2eEb7R9joV0ZOwrsqc=;
        b=UdE+OCXVkKdUREc/7UmgDU/RZ0Tas2CCgTDK0o4PMOf8sTpumCTR/MPsk3BuVqtjBm
         IH7RgNDNjNHmLxC4wxqFlnHRQtTTsWFiMNeX7pvYykQJg3JlLZ+3Hsjl1v1ZrDWr5k/6
         jqjprRr/DKa8fgh0bdR/nFlQ7DJ5MEMXCEOHyxOIViehpSwvJdHHCnNEbXAu0ow1iE4t
         4fm2KYbp1n3VUv+o40peGeMrQp0cdnPcN6m0XGzUUBaoeDvPZ3Grb4Cy/eobPIbDX/AO
         enN479Cy3lfjfe0lv/zmGQgHtERoblS+u5PlT6v6958WGQ6Z4tN5ERoDs/CfFfPacpny
         +HRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287961; x=1793892761;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgjozZfcfxRUL0L6/Quey9cER2eEb7R9joV0ZOwrsqc=;
        b=mKNkZiU7pPRzYIMGjQQsdog24iGKefKXHiqjYtLMBfRFlo+hTB236SDOO2MyV7lQ3z
         xin6WRNaXXeVPp60VI6N7dFhSwCYoakD6DQkJ/e8WwECHpzAkU2KzTckCxt5shbTJ/n2
         iCWN0iUZDWoT+RE69ewp6I1joRp8wi1EKa8hOkRJQKlc0y4d+C1xkftB9XlwJg12gNsJ
         ulFGhTRPIupp7g7lJGAVMRBBRd0DV+QHUD/1z6kIqHLm9+88ZrLEzkqr5Ya8fMwcFHcY
         wmTJdWhzDrnxc4b6OncfB1hXjvbwPEp8XuTxg+PIhSpi9is+SUmCguJoB6STfNvZHT4o
         G3Lw==
X-Gm-Message-State: AFq9FYKRu9o+ZToaf34fhcTCvgJzMiiPfRqdDVFB0SMmARexRaNDccBl
	zlOAMF3Ege+aySdtAHgKo+TkXfMgCMc5lW5Mesnz+qErhFSeAWBJoR7jmDYhg50eSUSnCgvu1fw
	qOP3JB6nDPTbjULK1A6Msc0aK5sJaBIG6F2gm+WGRCnga+ShMeCUOgnmGag==
X-Gm-Gg: AYBFou0cw//8V6WAnXAsAASiiyreMlBtIK+4tpzveBytPQZXyVBAwoYyco7I3GirIaC
	3pBgGYEhEfFVk5dQo3FUdF34ja4xTSiah/oHw50EycSTV8uSdgRuFntRZXaHoaE0xdmqEI00NGF
	fcSbV6IyN7Vmu5Vs35CvfH/uRyCvVZy/GFHLMyDjQQCVxu+7ZHqYNm1cFetO9X8kXjgTK22Lc5q
	0D4NGhxWpHxEWNbH4nKNf21+Ix1tliUW2SCQRy1XcCSnVMsEvLpW2ua2vY6LL3KJrjl9hNL0GXf
	XLSkjmGEDrWT/+dKpO6U+K3JLZQbUS1pax8Cef9QFojy1Q4VjY4cgT7J1pIAMPNuJRrVjvYtX7J
	kjjob0TyxuzRTN9K7X2stz8CblSY+p5IuT6uA+lNGg4OTATi7T9873x2q5PaXch+L
X-Received: by 2002:a17:902:bd95:b0:2e9:5a0b:9f3 with SMTP id
 d9443c01a7336-2eb1b2ca80bmr4692345ad.7.1793287960943; Thu, 29 Oct 2026
 08:32:40 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260528163448.4031965-1-briandaniels@google.com>
 <CAD4i_GRm4=0vTkpnwx6yrcha1YTgeQR0H39JRqi0PZN4TxwqUA@mail.gmail.com> <a0b95ba3-c75c-4843-b2ab-b7f94571c084@kernel.org>
In-Reply-To: <a0b95ba3-c75c-4843-b2ab-b7f94571c084@kernel.org>
From: Brian Daniels <briandaniels@google.com>
Date: Thu, 29 Oct 2026 11:32:28 -0400
X-Gm-Features: AclHuK-52htXy6ZJSXEXQ3dYUhClzCMKJLWsQFI-Mn00t666KQqf2Ty5vVKYfNU
Message-ID: <CAD4i_GSf8-+qEM5WqzYt4CsUb7M7-PHbjxAcVMayBJXy2qNzbw@mail.gmail.com>
Subject: Re: [PATCH v4l-utils] v4l2-compliance: Add an option to override the
 driver name
To: hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Sorry for my late reply, appreciate the feedback! I've implemented
your suggestion in a v2:
https://lore.kernel.org/all/20261029152030.3764241-1-briandaniels@google.co=
m/

Thanks,
Brian


On Wed, Sep 9, 2026 at 10:28=E2=80=AFAM <hverkuil+cisco@kernel.org> wrote:
>
> Hi Brian,
>
> Apologies for the delay, it's been very busy and v4l-utils patches are lo=
w priority.
>
> On 28/08/2026 16:38, Brian Daniels wrote:
> > CCing some more people to hopefully start the discussion. Thanks!
> >
> > On Thu, May 28, 2026 at 12:35=E2=80=AFPM Brian Daniels <briandaniels@go=
ogle.com> wrote:
> >>
> >> When using the virtio-media driver, the host and a guest VM are used,
> >> with the guest VM proxying requests to a host device. The driver name =
in
> >> the guest VM is reported as "virtio-media", when really its proxying
> >> requests to a driver with a different name (for example, "uvcvideo").
> >> For the test to pass, v4l2-compliance needs to know the driver name of
> >> the device on the host because it changes its behavior depending on th=
e
> >> driver under test.
> >>
> >> With this new option, the name of the host driver can be passed in on
> >> the command line so the test running in the guest can adapt accordingl=
y.
> >>
> >> Assisted-by: Gemini CLI:gemini-3.1-pro
> >> Signed-off-by: Brian Daniels <briandaniels@google.com>
> >> ---
> >>  utils/v4l2-compliance/v4l2-compliance.cpp | 17 +++++++++++++++++
> >>  utils/v4l2-compliance/v4l2-compliance.h   | 15 ++++++++++++++-
> >>  2 files changed, 31 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-co=
mpliance/v4l2-compliance.cpp
> >> index 4e5c9d00..ddb4e7a7 100644
> >> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> >> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> >> @@ -52,6 +52,7 @@ enum Option {
> >>         OptHelp =3D 'h',
> >>         OptSetMediaDevice =3D 'm',
> >>         OptSetMediaDeviceOnly =3D 'M',
> >> +       OptDriverName =3D 'N',
> >>         OptNoWarnings =3D 'n',
> >>         OptNoProgress =3D 'P',
> >>         OptSetRadioDevice =3D 'r',
> >> @@ -87,6 +88,7 @@ bool exit_on_warn;
> >>  bool is_vivid;
> >>  bool is_uvcvideo;
> >>  int media_fd =3D -1;
> >> +std::string override_driver_name;
> >>  unsigned warnings;
> >>  bool has_mmu =3D true;
> >>
> >> @@ -130,6 +132,7 @@ static struct option long_options[] =3D {
> >>         {"help", no_argument, nullptr, OptHelp},
> >>         {"verbose", no_argument, nullptr, OptVerbose},
> >>         {"color", required_argument, nullptr, OptColor},
> >> +       {"driver-name", required_argument, nullptr, OptDriverName},
> >>         {"no-warnings", no_argument, nullptr, OptNoWarnings},
> >>         {"no-progress", no_argument, nullptr, OptNoProgress},
> >>         {"exit-on-fail", no_argument, nullptr, OptExitOnFail},
> >> @@ -255,6 +258,8 @@ static void usage()
> >>         printf("                     then this defaults to 90%%.\n");
> >>         printf("  -E, --exit-on-fail Exit on the first fail.\n");
> >>         printf("  -h, --help         Display this help message.\n");
> >> +       printf("  -N, --driver-name <name>\n");
> >> +       printf("                     Override driver name with <name>.=
\n");
> >>         printf("  -C, --color <when> Highlight OK/warn/fail/FAIL strin=
gs with colors\n");
> >>         printf("                     <when> can be set to always, neve=
r, or auto (the default)\n");
> >>         printf("  -n, --no-warnings  Turn off warning messages.\n");
> >> @@ -1026,6 +1031,15 @@ void testNode(struct node &node, struct node &n=
ode_m2m_cap, struct node &expbuf_
> >>                 printf("Compliance test for device ");
> >>         else
> >>                 printf("Compliance test for %s device ", driver.c_str(=
));
> >> +
> >> +       struct v4l2_capability real_vcap;
> >> +       node.querycap(real_vcap);
> >> +
> >> +       std::string real_vcap_driver =3D reinterpret_cast<const char *=
>(real_vcap.driver);
> >> +       if (driver !=3D real_vcap_driver) {
> >> +               printf("(overridden from %s) ", real_vcap_driver.c_str=
());
> >> +       }
> >> +
> >>         printf("%s%s:\n\n", node.device, node.g_direct() ? "" : " (usi=
ng libv4l2)");
> >>
> >>         if (node.g_caps() & (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAP=
TURE |
> >> @@ -1811,6 +1825,9 @@ int main(int argc, char **argv)
> >>                                 }
> >>                         }
> >>                         break;
> >> +               case OptDriverName:
> >> +                       override_driver_name =3D optarg;
> >> +                       break;
> >>                 case OptColor:
> >>                         if (!strcmp(optarg, "always"))
> >>                                 show_colors =3D true;
> >> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-comp=
liance/v4l2-compliance.h
> >> index 4a7af5f5..563075c6 100644
> >> --- a/utils/v4l2-compliance/v4l2-compliance.h
> >> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> >> @@ -311,7 +311,20 @@ static inline double fract2f(const struct v4l2_fr=
act *f)
> >>         return (double)f->numerator / (double)f->denominator;
> >>  }
> >>
> >> -#define doioctl(n, r, p) v4l_named_ioctl((n)->g_v4l_fd(), #r, r, p)
> >> +extern std::string override_driver_name;
> >> +
> >> +inline int wrapped_doioctl(struct node *n, const char *name, unsigned=
 long cmd, void *arg)
> >> +{
> >> +       int retval =3D v4l_named_ioctl(n->g_v4l_fd(), name, cmd, arg);
> >> +       if (retval =3D=3D 0 && cmd =3D=3D VIDIOC_QUERYCAP && arg !=3D =
nullptr && !override_driver_name.empty()) {
> >> +               struct v4l2_capability *cap =3D (struct v4l2_capabilit=
y *)arg;
> >> +               strncpy((char *)cap->driver, override_driver_name.c_st=
r(), sizeof(cap->driver) - 1);
> >> +               cap->driver[sizeof(cap->driver) - 1] =3D '\0';
> >> +       }
> >> +       return retval;
> >> +}
> >> +
> >> +#define doioctl(n, r, p) wrapped_doioctl(n, #r, r, p)
>
> Ah, this I don't like. There really is just one place where the driver na=
me
> is checked to modify v4l2-compliance behavior (the start of testNode()), =
and
> that's where this override_driver_name should be used.
>
> Hiding it in this macro is not nice.
>
> Thinking it over, it might be better to just introduce two option: --is-v=
ivid and
> --is-uvcvideo instead of hacking the driver name. If provided, then v4l2-=
compliance
> should just act as if it was a vivid/uvcvideo driver. Those are the only =
two special
> cases at the moment.
>
> Regards,
>
>         Hans
>
> >>
> >>  const char *ok(int res);
> >>  int check_string(const char *s, size_t len);
> >>
> >> base-commit: f2a3cb8a59bcce9ac9f7a7c5b71429610d638a12
> >> --
> >> 2.54.0.794.g4f17f83d09-goog
> >>
> >
>
