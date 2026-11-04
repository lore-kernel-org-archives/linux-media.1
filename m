Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834637;
	b=HTKHxdF/7ygUzTzqFVLXuYSSRDKJG+k8ajn+ef8riFYjtwVRdgA60kovmazjdhLv6BUp
	 vXwtTRih7wcT7TjfZqVTYUoBKz9Fak9sd+W8Soq0LAazdXA+OVzM10sEzn6oyvRmBC13A
	 Q2BlZmDZ2P6QA9MEBEO/lh+CjQ19ARuIg0jJxa38aL8QYfMJJO6e3rFvIVq7IqRkBBuL7
	 Wc1rfm0gHSie++1FO4Jzoyecnb87gMXdkYhCV4Woimyt5G03/upW+9lapHTejz3ybz3O+
	 NSsPBl904iyrdrzgl9vw94jwsi3fyL9fONDAcxHdKoIQnhYw/JRW18jv2878QUymcmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834637;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=nqHXzzxVsE9J0xxu/KT51BgKUbpghzeyO4tXgHbFmvI=;
	b=r48B398IcSqzp76deb/QjBES0oP5WJ77I4nQbb2UdYaGZWCOiDnlTdkc6wVU+f7c/pzo
	 BIRQkv3cvrqucuryZXdG4OGSliKprZ5tAhca2J+nelLW6IfbdZuASjuFjxa8ixJD0Jnba
	 Ah8OEuKXCM7z12M5cRuV7DWvoqNJ7xM70L9UrpP4+XIJbueiA6Er8oL7xQBZClfqdN+Jq
	 xy3bNL21Jji4fHFZmXBOAxn79WbRA0Hiyi/dOkJtqKI4U5R1Y2D1Hk38XhXnSYocDkZcR
	 HzkUxeiTr3XGwgWuIYPeUyr8cUcict/QREEe+E+NKOlj+lgE6NLsNZ7nARVNjkyh2cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=po12+LbT;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37234606A31B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 23:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37234606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=po12+LbT
Received: from killaraus.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DEBE175;
	Thu,  5 Nov 2026 00:21:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793834496;
	bh=09elGOmkADFoOXRzG0sm9ovoC7vimMS6aM5/n5L0uFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=po12+LbTsRcm/0reh/UGQm/GBrclOJdo0yaZyhEJcA+fsVxW+26Ai3sCriEuDnbGb
	 3TJKzY7UeSQEtFgtODV/G0tqdh0iraUpj9r/wJRON8Bhwmjb0dvq9T4oC3f694dFYR
	 7lMToYTQqkUCY5IWJ1oFArd5j5I6IC1jYDo2Wbwc=
Date: Thu, 5 Nov 2026 01:23:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [yavta] [PATCH] COPYING.GPL: Fix license text to match gnu.org
Message-ID: <20261104232353.GC3862409@killaraus.ideasonboard.com>
References: <20261104155613.764306-1-mkorpershoek@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104155613.764306-1-mkorpershoek@kernel.org>

Hi Mattijs,

Thank you for the patch.

On Wed, Nov 04, 2026 at 04:56:13PM +0100, Mattijs Korpershoek wrote:
> When packing this for fedora, rpmlint complains about the license:
> 
>   yavta.x86_64: E: incorrect-fsf-address /usr/share/licenses/yavta/COPYING.GPL
> 
> Update the license file with the new address. This has been generated
> with the following command:
> 
> $ wget https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt \
>        -O COPYING.GPL

It matches, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I wonder however what's supposed to be the canonical source of the GPL
text. libcamera uses the reuse tool to check for license compliance, and
using "reuse download --all" in yavta gives me a license text that is
formatted quite differently. Looking at
https://spdx.org/licenses/GPL-2.0-or-later.html, the license still
mentions the FSF postal address in the preamble.

What does rmplint consider as the canonical source of the license text ?

> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  COPYING.GPL | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/COPYING.GPL b/COPYING.GPL
> index d511905c1647..9efa6fbc9628 100644
> --- a/COPYING.GPL
> +++ b/COPYING.GPL
> @@ -1,12 +1,12 @@
> -		    GNU GENERAL PUBLIC LICENSE
> -		       Version 2, June 1991
> +                    GNU GENERAL PUBLIC LICENSE
> +                       Version 2, June 1991
>  
>   Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
> - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> + <https://fsf.org/>
>   Everyone is permitted to copy and distribute verbatim copies
>   of this license document, but changing it is not allowed.
>  
> -			    Preamble
> +                            Preamble
>  
>    The licenses for most software are designed to take away your
>  freedom to share and change it.  By contrast, the GNU General Public
> @@ -56,7 +56,7 @@ patent must be licensed for everyone's free use or not licensed at all.
>    The precise terms and conditions for copying, distribution and
>  modification follow.
>  
> -		    GNU GENERAL PUBLIC LICENSE
> +                    GNU GENERAL PUBLIC LICENSE
>     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
>  
>    0. This License applies to any program or other work which contains
> @@ -255,7 +255,7 @@ make exceptions for this.  Our decision will be guided by the two goals
>  of preserving the free status of all derivatives of our free software and
>  of promoting the sharing and reuse of software generally.
>  
> -			    NO WARRANTY
> +                            NO WARRANTY
>  
>    11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
>  FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
> @@ -277,9 +277,9 @@ YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
>  PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
>  POSSIBILITY OF SUCH DAMAGES.
>  
> -		     END OF TERMS AND CONDITIONS
> +                     END OF TERMS AND CONDITIONS
>  
> -	    How to Apply These Terms to Your New Programs
> +            How to Apply These Terms to Your New Programs
>  
>    If you develop a new program, and you want it to be of the greatest
>  possible use to the public, the best way to achieve this is to make it
> @@ -304,8 +304,7 @@ the "copyright" line and a pointer to where the full notice is found.
>      GNU General Public License for more details.
>  
>      You should have received a copy of the GNU General Public License along
> -    with this program; if not, write to the Free Software Foundation, Inc.,
> -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +    with this program; if not, see <https://www.gnu.org/licenses/>.
>  
>  Also add information on how to contact you by electronic and paper mail.
>  
> @@ -329,8 +328,8 @@ necessary.  Here is a sample; alter the names:
>    Yoyodyne, Inc., hereby disclaims all copyright interest in the program
>    `Gnomovision' (which makes passes at compilers) written by James Hacker.
>  
> -  <signature of Ty Coon>, 1 April 1989
> -  Ty Coon, President of Vice
> +  <signature of Moe Ghoul>, 1 April 1989
> +  Moe Ghoul, President of Vice
>  
>  This General Public License does not permit incorporating your program into
>  proprietary programs.  If your program is a subroutine library, you may

-- 
Regards,

Laurent Pinchart
