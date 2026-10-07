Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DC12F6562
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401506; cv=none; b=l0GVFiKZ9/06PrQIuOUETOLa+OTtrt/1RnLIoYksoKtXU6jcqcB21Hiw+LYpr6VQH7A6B5MngtU+YfMSmzM2JR9qolIsIZ/I01d1efhpYk1sKajRcyxf453iisdEDM2g7mhYnIYAa4BTJRwjFK1+lnJDLIYSQxkemFlUofAkgLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401506; c=relaxed/simple;
	bh=7L6nIauOojx6PNMnr049sX3AbgT+fhVNqsxJQ3Tm+5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DeAmD34Moinl6r62BvKCO11ZoOC0BAKYWdOuAWpG6fZ0eLfseGQ3t8FZCZBujy9mJD9sADRvsw5tztnMjme+s46BcxHpgIMGvcYGaQgMF7sV33T0ij3KJSWR9/mm77kr0N43el9Dh0eEUMcgqFOvxiaygiBtSV7xhJRE3B4JctE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fBi4C0A+; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fBi4C0A+"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-8875d220446so1234387b3a.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 12:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791401505; x=1792006305;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyq3GBYRSFVpRxMioqhmXIsyi2cWT1eDnrq7Jr4safs=;
        b=kyUlhFtK0B8b296QCgyN7QCcmDB5vrzJGIHqf46mcf5AKmlKIVzhZP5Ovl1wTgcwb1
         v6CQNBYTn6HAjkiC6L3MVryOQs1SrV8oUbgjpMBetUdvAAWstE7lfmJmlu05L4IRX36w
         /IRK1fC9fs31GuyhSIwdfvtXCWWAFvn8RvzbCUJvbg0GNv49zK1Dg2ZibYjgFUmpAEgb
         xIRFBDIsGpAQB8wYACYhKM9OXAQf9NXCy1DeRA/Uv4SBhnXVnUQXNW6ZV6J67UHL0wv6
         6EusNf4zz1GSyubozrvhTjNQcSBEzrKm30F1IPSZL3odJTfg3vtrW/CmGaLo6nHDm9kL
         8xOw==
X-Forwarded-Encrypted: i=1; AKwUvBxL9Kl7DczLIgVXXXq9w7NQC2dqVIkWsNEiFMlwquPUkjYl4Y+oGQOPgK6LmWNLtSOmVjdDW5DnGaPCPg==@vger.kernel.org
X-Gm-Message-State: AFuF++lbe2hfBeKyvePKdbmqQ/kISZcj7u5rtfrp/gTf+sH8f1zChKBL
	J649kvhOnB/U31n6enkC6D+BGASYqcEpa3B9d5oHPpWCscBl90nbvvvtDJxk9Kb7bgb9UXwEymv
	cBHPhG90ZYJLfkW48/sU/Ybs9OCFz/LPrgNcf5j86K7I1WGsbBYsVFwzX4CSMsAK7IEHLBXHn2g
	gM2kAlMDM9+9DCcF6k/rsW6ygkKG17lO0Za7Ar639fcZlHLFidzHz5IMOIIqagX1Xs++QwRed6Z
	rpqmNwPXTsNenU=
X-Gm-Gg: AYBFou3QJwBbUI+ZhAahfeQkM60vQj1V96vF5prSgqKM4gFypYweaDEhpG3T2JbGbDq
	REDaZHQ4a9mRvxsP3vEmZzdhCcMUQ/XnkI0P68b4KzZf+I7QFBPy+z8pdd+HBIj6M3L0ipdgFlp
	GjtQGEGYM85vGoc/FvhsmIgfVS6O4qN9iA15Pn/VME1E3WH6u9FxRzLk2P7PwUQmuBwWdUipE9c
	29IR1v7PVkX/61x2y+0ZsE0dyja21u4rlyegmiQiGeZfOMfMmQ86rzNeqkAyob+1ORups+17CiL
	T77fDfb4VdBBIu9D4Zusu09UtgOe6MSVJGFkTxKdo2Qkf81h+iin5UH946wsqu/EX/KYvHCJpGH
	dKK4IF0D7WebftkUoGMNUB48EfSYcXmh5SWj5KpqVYThOwJrh4wBrO9QIsLJ6LnqQDlLkmd4tTD
	F/Dg4ey96mDFkL0giG6yBcP8gWqbcrf7MJ5Kk=
X-Received: by 2002:a05:6a00:348e:b0:88d:7098:ad9b with SMTP id d2e1a72fcca58-891b167b000mr2654170b3a.35.1791401504919;
        Wed, 07 Oct 2026 12:31:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-124.dlp.protect.broadcom.com. [144.49.247.124])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-892bac90ce3sm36285b3a.8.2026.10.07.12.31.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 12:31:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5b14d51dae1so2046381e87.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 12:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791401502; x=1792006302; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyq3GBYRSFVpRxMioqhmXIsyi2cWT1eDnrq7Jr4safs=;
        b=fBi4C0A+ca0y/9Kq/hfTAyaDPHHTmmdTO8RnsBJxlyFpkYYML8eD6W+uTime08UQJ4
         RqYJHIbP5H7rODz1eEox7pc1nosorDtY2Y+x7/8uNFrgMoje8qt6XAPN5HN3Kb6I5AmF
         /DspscFEdtmeSvMtlwY6IcwPAgcivb/3FsDUo=
X-Forwarded-Encrypted: i=1; AKwUvBxpvdKmLslH37gc8lclV8YL3464VmbS9T549oTuoZ8OtwDh+Ng/5II/xq8hl4/EnR0mFfxXa2ZApj4Ogg==@vger.kernel.org
X-Received: by 2002:a05:6512:6696:20b0:5bc:d39d:99a7 with SMTP id 2adb3069b0e04-5bcd39d9a1dmr111698e87.35.1791401502432;
        Wed, 07 Oct 2026 12:31:42 -0700 (PDT)
X-Received: by 2002:a05:6512:6696:20b0:5bc:d39d:99a7 with SMTP id
 2adb3069b0e04-5bcd39d9a1dmr111686e87.35.1791401501965; Wed, 07 Oct 2026
 12:31:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910165221.7558-1-michaltoma@sicoop.com> <20260910165221.7558-4-michaltoma@sicoop.com>
In-Reply-To: <20260910165221.7558-4-michaltoma@sicoop.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 7 Oct 2026 15:31:29 -0400
X-Gm-Features: AclHuK_p60bvym_o76BpD0hlyr7UPkU5DEwSb2zlk7Wvj7QoYLhaMk-u3APgIZY
Message-ID: <CABQX2QOKv_E=Yq9z=eMPp+5kHZR4rXw=S_HtuBGmF2jnOvsTfw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/vmwgfx: Don't leak a GEM handle when
 referencing a surface by fd
To: Michal TOMA <michaltoma@sicoop.com>
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000386081065d452a84"

--000000000000386081065d452a84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 12:52=E2=80=AFPM Michal TOMA <michaltoma@sicoop.com=
> wrote:
> For a dma-buf from another exporter, such as udmabuf, this is an
> actual import: drm_gem_prime_fd_to_handle() attaches to the dma-buf,
> maps it and creates a new GEM object. The surface lookup then always
> fails, because such a buffer never has a surface.

It can have one. In the same file:

  PRIME_FD_TO_HANDLE(fd)                 -> handle H
  GB_SURFACE_CREATE_EXT(buffer_handle=3DH) -> surface S
  GB_SURFACE_REF_EXT(fd, HANDLE_PRIME)   -> S

The last call works today because drm_gem_prime_fd_to_handle() returns
the cached H, and the surface is on that BO's detached_resources.

> +       /*
> +        * Only buffers exported by this device can have a user surface.
> +        * Look the buffer up through the dma-buf, which holds a referenc=
e
> +        * to it, instead of importing the fd into file_priv: the GEM han=
dle
> +        * that would create is never returned to userspace, so nothing
> +        * would release it (or a foreign dma-buf) until the file is clos=
ed.
> +        */
> +       if (!drm_gem_is_prime_exported_dma_buf(&dev_priv->drm, dma_buf)) =
{
> +               ret =3D -EINVAL;
> +               goto out;
>         }

This makes that last call fail. For foreign dma-bufs, could you look
for an existing import in the caller's file instead, e.g. walk
file_priv->object_idr under table_lock for an object whose
import_attach->dmabuf matches, and fail if there isn't one? A fresh
import can't have a surface, so that loses nothing and still never
creates a handle.

Also, the commit message says every call leaves a handle behind, but
the per-file PRIME cache means repeated calls with the same dma-buf
reuse one. It's fresh dma-bufs that leak. The WARN_ON removal and the
base ref fix look good.

z

--000000000000386081065d452a84
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIDgY
XMLoisLF0OgqxQGtwy8nSuhrB1bhysCmIG4stWEvMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAwNzE5MzE0MlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAJLYiEv6fXaf4f4agM5cAMBNrCPRP+6b+Xr1Gg3I
YBrUO//ClEjHSH4xzLZTmMwPZyxotxIrVVkORroJmI3f2/eDiJW+KdjIfZCrwQUxphA4b+IjbmbQ
CChITYVchzBMwLQz1BtVEcWsb5X10fQvHUleU9EW3zNenmlaBf8tLEidAss0sbj06FY1kWDTe+OH
28x80hrvESQFPMq3rpqWZc96XieWCVyMKH55aFwFt2OCpoJOZDq+lgPWq0x5TPiD1v9BdJbfVzv7
mkF3QJx7ckbhICqFznxYbPcEl9USxNiNE2jjMqE9OvEZmpnfj+lEpTF2CLVUFu8I6D/Q8bYkfN0=
--000000000000386081065d452a84--
