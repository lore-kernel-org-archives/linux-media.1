Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD1E4E2F3A
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082773; cv=none; b=YX3tdGPKafhYdUSifa34Eqo/lR8kvlS5dkuz1eoAccA2nMYq+hR2+zOBfs8V8C4sFYPuKD8SI8AxjXdUS6BwXhItizfFFWlwu5JGNc7uK6kh9XYhZIWo15P9ztSJ+sKeIjZVmNUplCHjTzkS1piVIKbxsR3OcryrKFCWZCC+PZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082773; c=relaxed/simple;
	bh=L9ivj6F1njnBdE9QMz9eHwHyx9GdNLTt6GhcaR8w5Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyCOhxtD1MErKk3lX4sm5TiBziNA5SYT2Y6oj1uao4xIGDAnm6cQsXrcRlb84WQTC/iOFH8fU2ncJAPsf92RV3iOf53NHAa01piRPDt02loHV7Q46986PkvPbLAZ7D+DSvAzh9pZfUAM0iD1Aj8h9cMxZ2/+IP/AiTB9o2mGZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GDhfLuRi; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GDhfLuRi"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1014244a91.1
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082761; x=1792687561;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPB94O/AI/A3xYUbIRIZTNdrP0L3CZ+/HRIQqblsftw=;
        b=LVXU2CtTZpIVDDdd0uLvRpGChfbxC1Mfx8pyjTQUZqOFPCHg84kzUNDen7tgpLEcjf
         CDcXU74nDcLkBQ3MZk3CutigtEZyT/vySLkOiFG4n5gsw5FCu8xsVRubnlbwzdgSbxWD
         +LOnZ5tH6IYvD+loLP+Pp15ZaouDTzgNiYItmWt4t5FmAGAaYbSHR8rHpGuGh7CKTYWA
         BA/OFPLjxfSEKARhtBJcG3X6QBkmYcUaHyGul29L+IPR76B8wQxa5cRtgXOdo9fJhMdw
         GTsktsihmZDzMbXz594N67CbZV92Z/ZD1cUu4NnVS84A40EwphwukEi2H+L9bTV+fCVt
         5CJw==
X-Forwarded-Encrypted: i=1; AKwUvByoMOuVKpN97LytIueJpw8Msn1aRmUDDa5eOK2mxxMLP1UNbpKCK8kq1ioQUGF1nYV865LThAnDlwem7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNSNUiNoYX2akY4U+inRVCU4oQjKqUJ8ubPc+rRS4TWGOLZiW5
	zPu9MVifDidruVfkV93oTqwDM5o9GF7/8KE+z3HmoxoOymwUR/EKAqW83e4jD1SopLT4B2WFsHT
	RbwQOxBrFdqiIylVXtm+MwDZwAYIxhfo5DRwYzbl08xkUH8/9OkFyDbvxFqWu3/hU3T181BQn0s
	+qNFGdl4Ukr7ks/PwDbAlLOFGtfelExE1cfe35TCzmdNg1AWZLM8TDxPYVf6sbTzUKGBzt1hDrt
	vvEMSW5ZryJkPs=
X-Gm-Gg: AYBFou2lGJAg2WWTchLZkPGN1DAV9s+O/qrbdbWhlwjC2OFGXt25qh25QPRtfkrPVGT
	bNcPPdiRNJPIPZK4v+SJHGCl9uzHJUnUMgsWWdBjL1DpjKVY0YMVJSBj2W+od22B8WEr5IDpXIG
	YNUmTkz8rbGupTl29RqzXvJyYNIy0SnmpwI11smn5hXrnT1kmukCNuiRaqifupgMWRn2YkFTqtA
	EfQigIN/nLz1ZEo8zHBFE4m1xIgSKTpjsyG9ibg8Kv6QxBCcMHinOAgYJ4GNKAjeY9+xtpn882u
	GuEqjPVMYlM6r4yKa00eoVUjn9GZuAAcCbSTxrNpCOmJsv2pfGgIZzLcWNa2PSxgllNQjkzKjky
	SjLlq47yclZAJMjwqyjfS19TOSEOxWqb2nKJhRhl5iKOyQtyKZwLF2FRis8r1nOKhTFyA1cQ+bK
	fn+1gg+gl/aBhc3LyrlIqxpffGUfBhKwYaQZk=
X-Received: by 2002:a17:90b:2e48:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3ac9c379a4emr2801803a91.49.1792082760848;
        Thu, 15 Oct 2026 09:46:00 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac938ba139sm876124a91.4.2026.10.15.09.46.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2026 09:46:00 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so3311466eec.0
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792082759; x=1792687559; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPB94O/AI/A3xYUbIRIZTNdrP0L3CZ+/HRIQqblsftw=;
        b=GDhfLuRiW23lKrAo70vjOoEnSKaPU0Ua73urRhSBCRucLZcY4YBAx8l88et9t3MO2q
         Sp/VeB/2FH5nv0gKICRNhaKF5d6Tvnrp0LmHub1cNoXG2+nhkpUfKXvjUKHfNdDpa+WY
         Z5iBPpmUwfHJfbN04QI1H3wuhEuOjbh/qi6Lk=
X-Forwarded-Encrypted: i=1; AKwUvByPmn8pSGZl5vdyXXJg6hpiy94YM7x08G2t5uFwF7FLPAPkR7x1wP4Do8NGS2vLCmXBoleyMAgeIjKZNw==@vger.kernel.org
X-Received: by 2002:a05:7301:78cd:b0:353:5908:36fc with SMTP id 5a478bee46e88-3537dfa8c6cmr25184451eec.17.1792082758663;
        Thu, 15 Oct 2026 09:45:58 -0700 (PDT)
X-Received: by 2002:a05:7301:78cd:b0:353:5908:36fc with SMTP id
 5a478bee46e88-3537dfa8c6cmr25184392eec.17.1792082757800; Thu, 15 Oct 2026
 09:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013120211.135807-1-matt@ozlabs.org> <20261013120211.135807-4-matt@ozlabs.org>
In-Reply-To: <20261013120211.135807-4-matt@ozlabs.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 15 Oct 2026 09:45:41 -0700
X-Gm-Features: AclHuK8gEHzRL7o1P7PbsprYTPQIJqIPg_1G1oX-C1t78VeDlarF5hWwxG694Uw
Message-ID: <CABQX2QOis8GJK4Mm8FEuH8UtrXF1NbeMoN8vQD5j4Hwcdk8JoA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dma-buf: Annul dmabuf->file on file release
To: Matt Evans <matt@ozlabs.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Zhenyu Wang <zhenyuw.linux@gmail.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Alex Mastro <amastro@fb.com>, Alex Williamson <alex@shazbot.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, stable@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000480453065de3c892"

--000000000000480453065de3c892
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 5:02=E2=80=AFAM Matt Evans <matt@ozlabs.org> wrote:
>
> The dmabuf release path is split between file and dentry release:
> dma_buf_file_release() is called shortly before the file is freed, and
> dma_buf_release() calls an exporter's dmabuf->ops->release when the
> dentry is freed.  However, the dentry can outlive the file (for
> example, if opened with O_PATH), meaning .release might be called some
> time after the file is freed.
>
> This presents a window, when closing a DMABUF file, in which
> dmabuf->file points to freed memory yet .release op has not yet been
> called.
>
> For VFIO, if a buffer's .release has not been called it's considered
> still active and subject to move/cleanup.  If so, it attempts to
> get_file_active() on dmabuf->file: a file close with dentry held open
> will call this function with a stale pointer, a UAF.
>
> To make this pattern safe, set dmabuf->file to NULL in
> dma_buf_file_release() to reflect that the associated file is now dead
> even if the DMABUF is not yet gone.  A get_file_active() ... fput()
> sequence concurrent with a file close then only executes as one of:
>
>  - Gets the file before file_ref_put() (dmabuf->file valid)
>  - Observes dmabuf->file pointing to a file, but it's DEAD (no file)
>  - Observes dmabuf->file =3D NULL (no file)
>
> Originally, drivers could assume dmabuf->file was valid until .release
> was called from fops->release.  This assumption was no longer valid
> after 4ab59c3c638c6 ("dma-buf: Move dma_buf_release() from fops to
> dentry_ops"), which moved the callback to the dentry release (by which
> point the file might have been freed).  With this commit, drivers must
> still consider that dmabuf->file could be NULL before .release.
>
> Cc: stable@vger.kernel.org
> Fixes: 4ab59c3c638c6 ("dma-buf: Move dma_buf_release() from fops to dentr=
y_ops")
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>  drivers/dma-buf/dma-buf.c | 21 ++++++++++++++++++---
>  include/linux/dma-buf.h   |  5 ++++-
>  2 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 4c9add51f9ef..61485fc28b8b 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -193,11 +193,26 @@ static void dma_buf_release(struct dentry *dentry)
>
>  static int dma_buf_file_release(struct inode *inode, struct file *file)
>  {
> -       if (!is_dma_buf_file(file))
> -               return -EINVAL;
> +       struct dma_buf *dmabuf =3D file->private_data;
> +
> +       if (!dmabuf)
> +               return 0;
>
> -       __dma_buf_list_del(file->private_data);
> +       __dma_buf_list_del(dmabuf);
>
> +       /*
> +        * As the file is being closed, dmabuf->file is no longer
> +        * valid and NULL replaces an otherwise stale pointer.  If a
> +        * reference to the file isn't already held, the file can be
> +        * closed at any time, including before dmabuf->ops->release()
> +        * happens: dmabuf->file _must not_ be accessed directly.  An
> +        * exporter should use get_file_active(&dmabuf->file) which
> +        * atomically tests and acquires a reference to the file (or
> +        * returns NULL if the file has closed).  The barrier ensures
> +        * get_file_active() observes the store before file_free()
> +        * frees the memory.
> +        */
> +       smp_store_mb(dmabuf->file, NULL);
>         return 0;
>  }
>
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d15b2b31d3c9..a31eb0ab9ecf 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -303,7 +303,10 @@ struct dma_buf {
>          * @file:
>          *
>          * File pointer used for sharing buffers across, and for refcount=
ing.
> -        * See dma_buf_get() and dma_buf_put().
> +        * See dma_buf_get() and dma_buf_put().  When an exporter holds a
> +        * common lock with the ->release() callback, it can use
> +        * get_file_active(&dma_buf->file) to safely acquire a reference;
> +        * the file could otherwise be closed at any time.
>          */
>         struct file *file;
>
> --
> 2.47.3
>

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z

--000000000000480453065de3c892
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIBCL
84tfrxmEydRsa1w33yx6kN2PzfUL8NyJllPrxqdvMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTAxNTE2NDU1OVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAGzG9yKhRrbn4VGJFWDcPw20WJoiE/6KD+Cg1KqC
h6BS1xXVufGiY5gvfwlaKaa0uX1BMOOXBkCA2l+qN82gilIQSEhXBk0XzvoiE1up8Ps0m3ncoAKn
F8e87A551Eyx/OFtw+fVvLeaVYj2kkn3b+8AY/mVE7puKUU67aQ4nz3A80sIR2S5KfvnuxkXndSA
+inJYcHuzXJG2OlbN1wvw38nsQCiVR+XbeSCih3eal0TAIO/c2oIUGF9TH5rjMn0ieVUtp1Mcn4J
3/gCN7TwPt6dfmultyHXyj6LJ/ImFSvZarTc+BRxJziqjHIqJmdez6sAKsbQU4XBT0G8XV42JZE=
--000000000000480453065de3c892--
