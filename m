Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951F3426EB9
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578856; cv=pass; b=h8hr7tr0cGafiaWsgncj+DXwJI7epNCagVQT8Y2ujhUy6NNbepupIvA60upmzzyyGiV/Y58aiLiCi0YWA8m6RZbde7vgVY2ZMt5acNYArRkULzt/lOY3daxlTVNOR0D6o9gzSNZVBHR9/MBzTWV9E7XM18ShzYeDYL0BODQ5JIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578856; c=relaxed/simple;
	bh=yUj31ZGpdd3o5l9yOlBN23Agt7G2vAM9AwSCCXKNMUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syG9RgH/SI6IpLahgneptFJaIg9X6RZqAadPjpwTAxDePVS4e1oqCg9eXQDlnZPET0POrzFZToeLYEOUj2uxQ3mxK0vZLPwIu6q4BisbGQNobAmWBPxuSnzXuNtFr5XQVX7413iEJ9fl99WmLCUk1cc/YK1kORATzwZRNmLoJQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDR4a+oe; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDR4a+oe"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e65e18969so245550185a.1
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 06:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787578851; cv=none;
        d=google.com; s=arc-20260327;
        b=rma6mRrIJsJCIk9qaT6iQppP+sFpdC3KfSpmCVZIc+oyvHWUqRtvFqV53DXR8MGFBd
         PGyNhXIJR+JiPuqTDb4mKwcQqSjNaAv4PSIMJi1Ej6R64X05fadEoajN+YZfJ/JsD43d
         5ydxNxDkJhyxWV7JLd7EsSsjapSaU4KxIHu6eslOBA1DMgExRbgPetLiKw7l40GTX9fV
         ytxcrzBkAHeSXINtx1dY6zYPAVcJS0H7lKjc39VqbtgFAZYegOAWYyFeHumcPtMgEs/z
         g0hwd3xD5odFt4GpHwa3pUy/1SeLmW4+4DqZp73oJ2sk/CNtWZIVa4L1zBl/MR3Z3ikg
         /VeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yUj31ZGpdd3o5l9yOlBN23Agt7G2vAM9AwSCCXKNMUM=;
        fh=dm2xUpzu7QlDGHuoGmdgDdM5KIt2NVARUjgz96emXZM=;
        b=ryEcRpWHGLKe18FEip0TVk9h3UdEB0h3+vRVDxEhVHXtYUaihW3GeEtOuyyRPKcqln
         SiIiQsjpT2Tsg6kpwUWH0Nc3IW+7VbdsMx5is2Zs4FZ62syv8mQ1JHtla55oAyPRy/Yx
         vdBUYsU5j//tKWHN8+UVIN37USHMV4Sdhy0nVrjPw4ormOsBhcNgsTlwx3sCipDQeDlu
         IqGpvmnHM0OK7crtxwQdO4J87dTAERy7WT5sXGWuQtl+mdfwRmDu9eQ+i9cNqB0c3q/g
         YJhs3nwQAg28gGsgd/zrnp9xrMEBoe2dwVI4DmPLH0X6YmATDYHsH8Z+/uNCAZY8pxVZ
         aSrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787578851; x=1788183651; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUj31ZGpdd3o5l9yOlBN23Agt7G2vAM9AwSCCXKNMUM=;
        b=QDR4a+oenTJQs6v4hlBS3fpOLA6s2DhjKw4d2IN7+HqS49aiFU6Uf/RgQ6uOdUbQXE
         6KqkXqiaWMrPTV2fVgLJl1554VUFTsZTpxqqmjmJuaxe3m3fVVKqE8UpEZ/y9WjfcxGO
         DYVoRo6OC7/+646GA08xcaYesUn+FZB4hBpUipuHDguEwxNaWuBpcdWq4FYt2maI+vcE
         x2MZEUgKFEsizHFsj3QZelfev9bovDkT8nq2pfZsEc0ijrxdb8MjK93f0s4ks9THl/KV
         4KT22T4w645I3pTB8K6Vwu0BGc1BMUPPbXQrWoplq61QVQblrql8e1eUamV1ivOssryr
         bkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787578851; x=1788183651;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yUj31ZGpdd3o5l9yOlBN23Agt7G2vAM9AwSCCXKNMUM=;
        b=UiWzEbdo34SDCGmwowRIvToR+YCeUqlfIM+8mKbScquO0BnElGR36AMwbVM0C0e2kv
         8BPZessB4TMOpdlmYsKNaDIht3OBStSDM21fE2Wvzvy+VaZVaTlq1tqojOkwrXit4pNn
         9rGcQUpnZ7sFhlI8qvs6SXk3AInjq/TJsHgzkwV6btZxujYOxCDJuC/s6QAC1vvNwtUQ
         JNOPoesMTLEeOteE2Rp56QnR36RTZkc1vqKgGXEZGfY3yQsGz+ZW9y9eOSnyOd6LZdmy
         IYWbPx+2PJI1DsWhh1Zww0kT91L/ssCP5e0PVoXyV+20UDp4kjZrkeim9nFO2g0oCkRE
         Z2Bg==
X-Forwarded-Encrypted: i=1; AHgh+RoNKH6XAcAbc5IvOdp0+wQpnpnRp7TUlHk4pYq435J/sth890PU9/QUpGDqLrSCsBPBoIprAH1bn2UkPA==@vger.kernel.org
X-Gm-Message-State: AFuF++l3fPEBgQW7APJRXV3DwpRnzhw970IoQN2Ux3NvJNeJlBNn5yqP
	9jT2uL8o4h2xksm5rAANb8ea74qdEOcMzhG/3/Ugeqt7Bagb76P242blFD8H9bSI5Qv+ezJN2rf
	RJN4zLyOo6+VOMWA4U6at0Sgs3pwPLAA=
X-Gm-Gg: AR+sD13jyp0EJcUj72Lr2WxDrxJ40Ug1SOxn9N6ATEx+tIlkgEcBIpQJ1fBtazlDVqZ
	2pKdHEK7B2puTL0DPtcfyvQaB7nSZw/WaxwCRgoCKeyRIa85e5sz80enl1J1UhYii3cw8pDHJCq
	uo8ulvwcU6tNXLBGX68iHfn5NLEjD4tHPlnGspYXhGEpwbaGi6ppXtBRN6nnFkCOfNx8IOLI+ew
	SNIqe2d52QD/CO8EdViSFnG3dPyfwB0mw4DAiCcu4YRlQKJJleqYxENdGih9tpl1Rdy77m0YxB5
	jFWCof7zsn+Qahf2FQJHGiL/kcXP6q4mQZ+6KzCeD5aTan/JtyRv1TI2TJRmAZpKveZFoFQykI9
	XgoGBrRH8gbO7S8dZ+wvBNTMvuraAEMBuVNI=
X-Received: by 2002:a05:620a:2b4e:b0:936:cd75:8f91 with SMTP id
 af79cd13be357-9373983f363mr2477945085a.12.1787578850834; Mon, 24 Aug 2026
 06:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com> <20260811170414.644-1-tharitt97@gmail.com>
In-Reply-To: <20260811170414.644-1-tharitt97@gmail.com>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Mon, 24 Aug 2026 20:40:39 +0700
X-Gm-Features: AcwNN1XyTM35jVN04XILGWdzSiiMBkS6yyg9V-ft8lnblzKyDIpEj6CC9j6Fv2o
Message-ID: <CACak8wMDzt8d60DkAvgvwtnxfhuwJXPc+mDn2q7jpnQsmb3KLA@mail.gmail.com>
Subject: Re: [PATCH v2] media: v4l2-ctrls: default HEVC SPS chroma format to 4:2:0
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Pavan Bobba <opensource206@gmail.com>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

Hi,

I haven't received feedback on this patch. Is there anything else I
should modify ?

Tharit
