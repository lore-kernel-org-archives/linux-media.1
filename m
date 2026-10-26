Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008796;
	b=v4ZioCkXY0+9oo09upuJ6x/1zwyneL8p2c8BrlVfZ3PZjC8MMjM58eVlT/MjfDFcAXmf
	 o+6g7P1F4CupkRShNNBBa8RsfT5C4yHO7jphV2/9uWwPl2IFceVoRZcC/OQFdYcfZjNPp
	 +pZV4RNJzPnHXNh4UKU+ity6CQcYWQnN1pqKMZxmhgrrPfoporY+4AY3fn+0iW4z4VU//
	 T1YntZBfTiuTwt6wjXBs4iuhoGAmi84wiP1ySQ6KZsXmgZSwgIHrWwJRDHwVEBPHZVtgU
	 cpeFz7hY4nDpwA80rTRsmpp/3u4jYKilS5MIB82EvEAu2vTMvuyfWdGYOqkgMz8eqiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
	b=0xDGMgQTucYx9OhqkVimuJqccZHBHbv7T1k1o4+TAWwjIIlFHqM0mpv75ETPXo0WLOky
	 X0evyUp9YKojTb/Jc05VuCxFGVFcPZTjR0vGbqy5cAgocvU3nHcjRwGPA74v4AOZ8xWr4
	 4s5O9UD01E3bIOq27VJRH0iLlsuCIuOzH8BZ+/dPc7oogQ4vSIZh7Mmib6vwf28ttYRcn
	 mmCgiuNfPxNIp23T/y0nCzZqgPk1JCsZkoa50JL3RzuT6I6TRrNCGbj7ZF8FFUOWn9rmZ
	 mmY5VaLOXIKIWcp+FLfFv2hgJD/7K9WmenFNN3GzE5pQLppFROnvL31Abzyuhqzuu9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duOPPQmS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lq4wGaDO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51F2606A31A
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B51F2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duOPPQmS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lq4wGaDO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aTvS1708665
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EihPl48XyzquhIbKjuEyAajD
	35LkfbvtwIfgKv80/jQ=; b=duOPPQmSNBtx6zhy2MyD4npHJuJX7Gm6wHBXP8ce
	gso6SBXwNnKeARLD/e0CobapPe+Pf7ies1PCMX8l0Ug5iwRxIVau+SXTqeR4fsTE
	bPqNxK1Bfn5d+FDp8KiVM+Bp+TZkWsYiaO5Dxo3FHoaEt9Yu7ndZYJNRki6RGyau
	e9TqyPtI9Gei8s75Mu/XbJ23qlTZsPaJIRg3qr0eUH6Wvuq+DaaJU5SFPTDHFggF
	7OibQZR51kSYWjQNBxzIW8c0qzGWVc8rErJCz0VI/N1iO4JE5O3EbCK0hg/I3CsL
	BG8uaN7ChjqvVzPqPBbYVSwVAksgA7o7Ey9Rzt7q1IwiOg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd9vnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:59:55 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so401641137.2
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008794; x=1793613594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
        b=Lq4wGaDOBpVkSPMT650pzVDZ0ZdqcSGrAoZzfFFdM518fJR89ZIGJx6eXL4yL13Xrl
         9oCqAU0R7kUVi1UhMw8akonpcHbyZwFuJSqb2u0tKGPC3YAvtla7H51NOZadFUZSmL2Q
         r16hd6Nxd/2pcqEyFFpl+3UUTK8ynsmIJlWYJhXm4y/6UIroUCCKK5bS4dQlsFUeRuZD
         +7dv+Yy+eyqDqM0WLJ19pWBstqB3OdBiZ+hFQNu63MhCIR9KRwPkVXUIAerjgns2bfb6
         l4jF9umI9ok5cQKWo5grKI3y0p/QZRQ0T53+Wdpe+LNpYXhCZaRkEVf7sKuP/riR2oQH
         rR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008794; x=1793613594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
        b=E/sJk4xqNVsTX5pADiOcndsw++z5V1YQiCspSaX0c8+BLKZt/aC3YOer+gUvcJGtZl
         w5QqWXkHXzKIW5S06MAiVSm+EfqhocQbvCvV/+aXDV/JZrLOiy8961AotVwrv1fWjThl
         Vl42TaGiWOWwjSEx77ZnON75vHIgQkoxCE/cjEAaIEl2cYoDCul30m9x9KbIxej1dc0b
         Hhc73uYqUxsLg3L3AVb2n5p8LJML9JMIGib6DG1vfVVOgInpvXSCcdTh73G4fCPMd30C
         wxxn03/65OsQWYrZ5GPdsDiMoafi7iHbYgviSYX7fVIZzhVd63zjDY77alV6W8pqx+AE
         /EQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgjtnSMfY6pzjy6xxNlGtyUjhRUmu2KnER2pJ0d1n0/baaddPh1cLuh8uvcmus/orTJFJsY1xQTSCKpw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIAvTL1sliaAgBwMuhzqcRDNiEgnRJ9of4O9S3uxHwdetS1ukc8
	sFOexkGyCa5B0rddwFcYciHnhE77LjEzaPkhDT0ytGQbnt3t6D6L1Mf7+r3gVH5n6HlAN5l6Xtr
	KtrBZpWY39bAeklFwHljswT/ZjZ4wkpQMSq9+UPWHyL5EZayYXTh6tHAsoeIbpWXFBw==
X-Gm-Gg: AYBFou2bBzmfVnAF3z/yuW0k6s463lpohYjSmA+k2Jn9sIPmRuqxv5pnDWrSOVeW2wA
	oPBPDUyLlNGUUB6X5aNByxK6oveu9DpzAGyOi1NuEmEoeRagHYfuyz0SWCMQuv1Cpk3PbkWAzV2
	z5vhu/m/rPj+T/28Ts83046CNDjMbF8JcU/HkkZ2lPn3wv4QvcEkxKJWgiRA/dgEATKquNb/Sj8
	VBH1EzjQ3tncSHAtn7PkPkw9uiy1tNrVyEGSw9b/UtutmMIoOz0nIeVdEizTmTtfHwYmj60yI1v
	Oht6YW629GIPEUQ4TVhBiIA5DREW1Viu0dcIQHk+8BxbbPyAzZvXY1SrdcWB9keqSaovZVL1IZn
	4zwrVQWo7vRtYN354AoSep8UTfzMoi7IF2eFBuvRs5gcifM5avolueQ1NCCQVElXBznEmcjQY2Z
	94vM9gpZr3yIfk
X-Received: by 2002:a05:6102:511e:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7ce5cd65a0fmr1586651137.17.1793008793933;
        Mon, 26 Oct 2026 02:59:53 -0700 (PDT)
X-Received: by 2002:a05:6102:511e:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7ce5cd65a0fmr1586636137.17.1793008793315;
        Mon, 26 Oct 2026 02:59:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d0606sm16973671fa.14.2026.10.26.02.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:59:52 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:59:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 18/23] virtio: Add Qualcomm Platform Services Firmware
 Interface ID
Message-ID: <lisaligvjmnnib7gm6klab77jfzyagn5cx5pix3isodu2cjvrr@o6efvpyte5yg>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5AT7p0cwzS2IG1o9hEJbkSlJdnSAFXP_
X-Proofpoint-GUID: 5AT7p0cwzS2IG1o9hEJbkSlJdnSAFXP_
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf249b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=dTofmrguFlo4DCddnn8A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX6BSar7MP0brz
 utRom/Cf3YjDbHb1EIRlwGFgl7VUtdWxWLnDZGQ/7ofi9iJAB+a5iUoAtjKE9QwGGgTvgr5znk7
 rWql5H27ovtuFI0GNaTi+fSkBCxMapo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX8KYTBv6/fRbK
 SY9zYOCVwksMk8/8ARAtkbV7z/ejFlNr+lz4/4Agi13bdswTfbiZuVhSNkG3kmlJMTgKIRD24f+
 q7+knM7QlO4Cy58Z2i0aeSIZA8xTk3OiWFpmA9gcsva4AtNxv/wdcd6n69xFendqekqa6XYFjck
 +7JSrbs64anBW+slTg7ildcuEa+DtK3gh9KG/uCOxp0DmNwM4zSlka7qVXJosQQBuuaYjOVwmAz
 CDBEgL3bpvYbDRBTlou5Ha/qfC91YWSDG6zeBCT1drzl/apXS5+rSx9HeSSEsdsDjJRTZJ4FfOz
 p9zgajwq647BwaYEvXLtA6FMsOk1votWMMt0UH2lPVU8df2HGwt+TOtCSToFUUqP64XLy/2pBUT
 e8bTUp4XFSlvBoLw4LO0NzwfWqBQORPisqaYPce8hPKlZRMEaJ7hHiF6+TXJmMxZ8LZckoPV56r
 1gLsawooZK7SDMXioQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On Mon, Oct 26, 2026 at 11:51:28AM +0530, Jayant Shekhar wrote:
> The Qualcomm Platform Services Firmware Interface (QPSFI) is exposed

Can it be anything other than the DCP? If so, how would you identify it
on the Linux side?

> as a VirtIO device with device ID 52. Define VIRTIO_ID_QPSFI in the
> common VirtIO ID header so transport and function drivers use the
> shared identifier.
> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  include/uapi/linux/virtio_ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index f9056af0c622..6c6f283733b1 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -70,6 +70,7 @@
>  #define VIRTIO_ID_GPIO			41 /* virtio gpio */
>  #define VIRTIO_ID_SPI			45 /* virtio spi */
>  #define VIRTIO_ID_MEDIA			48 /* virtio media */
> +#define VIRTIO_ID_QPSFI			52 /* Qualcomm Platform Services Firmware Interface */
>  
>  /*
>   * Virtio Transitional IDs
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
