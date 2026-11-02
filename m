Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609250;
	b=Qtj3jPPn8J9zcTzCU7qUGab8ETQyrq6vxaqND3BrmCKVKSSBXn7ZwjojQxcvCI+FgpqY
	 O6EdTKxEEFg4RrCddjjwPzKBpSxJDd85ZcFmdOFlrvdN8TLnxf8i/a2h9cHQ/bHUfWDTz
	 39S0uqv1h7J5cp7nrDmtMUBfooIIfjWq5YXgeIEaKdFnOwwsveFBr+q+M2aQKAIeVjYVa
	 MYdJUtnTb2OOj+58txzo52RCs/LvoVzX5WDv53SG6RmQDZyN5lMKAFQWRWidB7AeHg+ay
	 hLoaCZ3AJvRMLZngfKGlZp6OSh6Mu2p2zjpbQNsQmoFlr1CMCzjMtQr2yyg4daki8PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609250;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=l6DsGMOyXtuNDoStZPgvM5A17Ioji7L+0RH6yC6Z3uY=;
	b=xhDzDuO/elpFmgl0+McnXbbzXwyvZ0FAsXxRFdq86taVUbo25YFYUFeiTzrXpfmL3r9G
	 vjE6f5ObVaRqQ4nIpVN65iOIZsRZNLDRZMsme7IVl+5YDcISqnbOBlLEqclLlI9uC4/DP
	 9TGYn5GpzQIE2k+Hxp4ue8Av148XBfWF/IB1KuG8pNAqa8aIz1sH4G4tPh9BX++DGZiJ8
	 2xlefqzjBOm8Cu3AsaPJgGEO/sql4gde2LSMR3KNyJhOuFO67jHpCv0yzQUdG5J4f83Bt
	 ct9/Cgmk5fLDfwZ3Etp5Vr3dGJqOgJ5o+TfkY0Y3GDZF1Hu6esPQATbEFyyxwnJ8y7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=GbB3EhDi;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dvTlFKdr;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5935A606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 08:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5935A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=GbB3EhDi;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dvTlFKdr
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 5E168EC01FA
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 03:47:29 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 02 Nov 2026 03:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793609233;
	 x=1793695633; bh=l6DsGMOyXtuNDoStZPgvM5A17Ioji7L+0RH6yC6Z3uY=; b=
	GbB3EhDiNpybHa8kt4PpX982+k63R35WFRwl8r/oZ1F4VOr08E8yfUQ1svHiAc1X
	tRX4uR5XKuSpz165KRk6KC4d4H3fi49IH402Du5mWFMBsjG8xTjsL8iBnYiKAlpK
	RxD0znwWxUMHqj3VfBHVt5JPVoIHDlqLaFGtbXbaicoMOSDsj64H4Sffxoy9s/KE
	7JkSFWrNx0aa50rsbEz+1eTDTuU8zEdLv1E+3t3xPUm+sDESRYWXU4xfwxFg9ONd
	FN+NQjyimXhbnssQJWE6dFH1qBKnmJrZbRx6jycAva/EDYJijTobv75ORz4/6sAr
	AIN/VI1jqQHNbxelQGqr+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793609233; x=
	1793695633; bh=l6DsGMOyXtuNDoStZPgvM5A17Ioji7L+0RH6yC6Z3uY=; b=d
	vTlFKdr58LA/trh6wtB4RBGkXgZBf2uHFU7n50nnjLxtZVHUCYwSCpPRjcxM6wZH
	LxrppkeYqfBhnotRPXlbD5cgpHXx/R84j/URzmhdBN6NzotlERj14vcKzNXUDCKw
	Iw681KG1U+nejM2xLvb7Z9KvrG96ZdFEYs03OA8JmQqdEZxrjk9muX48PlhSGxBq
	R+qsl0rphGUBO3iMlPctsBF7+FcDBaDetAbGYH7myVP2JM4PBeAu7Xl8bp3Uars7
	leWa6RqFLYUvpN4wGXEneET/hwQLeyb73lEsPjbXwmp79oxvmKukHfsEbDdcoL9l
	h1hXhOrFKKZXHaC+wwWdA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793609233; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:YPqEUa0VdMasZg32ekdDpXbJqWo0vroMoWENOKPJEYPQC5I
	6GSKEhUeYnMEkycLMpMPS+H6vrgzn54TVHX21U/CyaXuC0vmuWb/gMAD8/yDqzBe
	vM/j7WdFB5hqNAvSV+QU2AeHVycNncSMFxZ8Y53CNRuNknmD7jYc/43PNH+zmmT0
	gomSqA01t5Qe1eg0YYLeH3fUVikd9xTgATwFfuATz8gS7SGsKr1ZqoEIjUhHiTQT
	vOT+OZ3HzpAl9QgsZ0bM+P+QYifEjqoVQGt3cS5b6MWJMfgXv1IkrHzyPKUyxxNw
	dBEuPeQVWXR92IRKLxxa5kFqlyuVnj2OzywcDVg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:lY8/s58j5uHeae/SYZn6Q5MKOgAcEGJSIJY/AHMO/84=:hALQvJz53oAZKjfxBv3bBWFXhC+sQXJbjxtuhKKtNsA=;
X-ME-Sender: <xms:CE7oaj8CMpnVzEzlDwM11LaHHRvnXkh3zegNCVXkqb61X2p7SfeTvw>
    <xme:CE7oaqhi8rdFHFUVaSnYZ1uxeWonDgJuFWxIEuDhA9rrLDTqE6Ai4N5v9C9i7LNnV
    BlI3s8MWLKepsOTV4PcUlh33cr_OcW-oHBweAfx3NIyNApudHZfWGak>
X-ME-Proxy-Cause: dmFkZTF8YngIkqjubXoTQ71/MEbV9w+UTqIQ2wI8bU70Btlsc2Biv/ITwdLY0SySvwyES7
    0cBjn1ugARCmvsdejCIfHs5UHrReO7j1LcbT/rTxsbJgOi5nIH6NH3thRtOfES4CdcuK0y
    zK3FDMLxByEff1u1sEFXk2krXDha+mwjuYZcpL/h+vr3E3u6MaeXCwlpmdQHK1IU/z/g37
    NTOHoLn1u1v+wtgJZtNVn9rPvOzMUQDq+SIVOpp/xLaE/KqN8Zm6Fi08h65Lqay4PM8Llb
    Bxbh0dxbqxEIeJIIAFSmvxbWgfINpazKjGZKjhE2hVgLH9Bj7AMk1N5TDusFfYP2zdRSnb
    fIE6C84mJGoOB/MWb6t/w8q/rgm9lYqWKtKM/HqWjWzcx6BuXvIvHHJhrGz2BHSs5uCHzE
    zN5JGQsQg0zik6gYwK4c+q5H3L3DTufmkhjLycFENbClhxRGu82TzcS9fJDcNzoU7czbkQ
    uVCm5LvW7Kp2U83Y0EPI/gVXVuQGndTgEa6vci2WGb2OHEyoRLO7EnCdLNF4lTd2VhtAld
    BbFV+Y7nMWVssapR3ffyTxHJ3mgWTo7UVejJvtQ/O1rSl551rixb/v+LOVff9KAfDNnTBk
    k0veW72p8FtA96jV+c6Mx3qoI1h3pjZucvr1hZ6uzGkKMp4DRXnhQySEFGIg
X-ME-Proxy: <xmx:DE7oahEAiOvAF3aBW6R6IiO9l6qaWOltrof37fNBGnErnBkMqjiO4w>
    <xmx:DU7oagKVDrqScTltvDLGw6O0t4Eta4j22A91W62e2Dx-xB5SxPyx3A>
    <xmx:DU7oah8plnFzlFw8ivZww5QXYBmAk6dDJQpXGFSfJ5tt0qaohtQbvg>
    <xmx:DU7oaieG2q6mDfAP91vbWjygVqND_iwRGWAeiYesX6Z1r-BMqgq8zg>
    <xmx:EU7oaoAUDOt83cZeHMYy1cEuo-AetZ0QcF2Gg0vrhNxTaqjMrAzezNAt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 36D0532A0097; Mon,  2 Nov 2026 03:47:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AqeHuJwVl4no
Date: Mon, 02 Nov 2026 09:46:43 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>,
 "Oded Gabbay" <ogabbay@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Srinivas Kandagatla" <srini@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Philipp Stanner" <phasta@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, rob.clark@oss.qualcomm.com,
 "Jason Gunthorpe" <jgg@ziepe.ca>
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
 sandheep@qti.qualcomm.com, "Bharath Kumar" <bkumar@qti.qualcomm.com>,
 "Chenna Kesava Raju" <chennak@qti.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 "Bharath Kumar" <quic_bkumar@quicinc.com>,
 "Chenna Kesava Raju" <quic_chennak@quicinc.com>,
 "Ekansh Gupta" <ekangupt@qti.qualcomm.com>
Message-Id: <23d04f27-dd2d-414b-acc1-27e46538bfcb@app.fastmail.com>
In-Reply-To: <20261102-v4-v4-23-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-23-88f2f24a5f0b@qti.qualcomm.com>
Subject: Re: [PATCH v4 23/25] accel/qda: Add DSP capability query
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Nov 1, 2026, at 23:21, Ekansh Gupta wrote:

>   *
>   * This structure is used with DRM_IOCTL_QDA_QUERY to query device attributes
> - * based on @query_type.
> + * based on @query_type. @dsp_name and @cap share storage, as only one query
> + * is made per call.
>   */
>  struct drm_qda_query {
>  	__u32 query_type;
> -	__u8 dsp_name[16];
> +	union {
> +		__u8 dsp_name[16];
> +		struct {
> +			__u32 attribute_id;
> +			__u32 capability;
> +		} cap;
> +	};
>  };

I think it would be better to make this separate ioctl commands
instead of a multiplexer for each thing you query. ioctl numbers
are cheap, but complexity is not.

    Arnd
